library draggable_bottom_sheet;

import 'package:flutter/material.dart';

class DraggableBottomSheet extends StatefulWidget {
  final Alignment alignment;
  final Widget backgroundWidget;
  final Color barrierColor;
  final bool barrierDismissible;
  final bool collapsed;
  final Curve curve;
  final Duration duration;
  final Widget expandedWidget;
  final double expansionExtent;
  final double maxExtent;
  final double minExtent;
  final Function(double) onDragging;
  final Widget previewWidget;
  final bool useSafeArea;

  const DraggableBottomSheet({
    Key? key,
    required this.previewWidget,
    required this.backgroundWidget,
    required this.expandedWidget,
    required this.onDragging,
    this.minExtent = 50.0,
    this.collapsed = true,
    this.useSafeArea = true,
    this.curve = Curves.linear,
    this.expansionExtent = 10.0,
    this.barrierDismissible = true,
    this.maxExtent = double.infinity,
    this.barrierColor = Colors.black54,
    this.alignment = Alignment.bottomCenter,
    this.duration = const Duration(milliseconds: 0),
  })  : assert(minExtent > 0.0),
        assert(expansionExtent > 0.0),
        assert(minExtent + expansionExtent < maxExtent),
        super(key: key);

  @override
  DraggableBottomSheetState createState() => DraggableBottomSheetState();
}

class DraggableBottomSheetState extends State<DraggableBottomSheet> {
  double _currentExtent = 0.0;

  @override
  void initState() {
    super.initState();
    _currentExtent = widget.collapsed ? widget.minExtent : widget.maxExtent;
  }

  @override
  Widget build(BuildContext context) {
    return widget.useSafeArea ? SafeArea(child: _body()) : _body();
  }

  Widget _body() {
    return Stack(
      children: [
        widget.backgroundWidget,
        if (_currentExtent.roundToDouble() > widget.minExtent + 0.1)
          Positioned.fill(child: _barrier()),
        Align(alignment: widget.alignment, child: _sheet()),
      ],
    );
  }

  Widget _barrier() {
    return IgnorePointer(
      ignoring: !widget.barrierDismissible,
      child: GestureDetector(
        onTap: widget.barrierDismissible
            ? () => setState(() => _currentExtent = widget.minExtent)
            : null,
        child: Container(color: widget.barrierColor),
      ),
    );
  }

  Widget _sheet() {
    return GestureDetector(
      onVerticalDragUpdate: _onVerticalDragUpdate,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      child: AnimatedContainer(
        curve: widget.curve,
        duration: widget.duration,
        width: _axis() == Axis.horizontal ? _currentExtent : null,
        height: _axis() == Axis.horizontal ? null : _currentExtent,
        child: _currentExtent >= widget.minExtent + widget.expansionExtent
            ? widget.expandedWidget
            : widget.previewWidget,
      ),
    );
  }

  Axis _axis() {
    if (widget.alignment == Alignment.topLeft ||
        widget.alignment == Alignment.topRight ||
        widget.alignment == Alignment.topCenter ||
        widget.alignment == Alignment.bottomLeft ||
        widget.alignment == Alignment.bottomRight ||
        widget.alignment == Alignment.bottomCenter) {
      return Axis.vertical;
    }
    return Axis.horizontal;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_axis() == Axis.vertical) return;
    final newExtent = (_currentExtent + details.delta.dx).roundToDouble();
    if (newExtent >= widget.minExtent && newExtent <= widget.maxExtent) {
      setState(() => _currentExtent = newExtent);
      widget.onDragging(_currentExtent);
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_axis() == Axis.horizontal) return;
    final newExtent = (_currentExtent - details.delta.dy).roundToDouble();
    if (newExtent >= widget.minExtent && newExtent <= widget.maxExtent) {
      setState(() => _currentExtent = newExtent);
      widget.onDragging(_currentExtent);
    }
  }

  void changeCurrentExtent(double d) {
    setState(() {
      _currentExtent = d;
    });
  }

  double getCurrentExtent() {
    return _currentExtent;
  }
}
