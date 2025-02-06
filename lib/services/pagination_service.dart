import 'package:flutter/material.dart';

class PaginationService {
  final int itemsPerPage;

  PaginationService({this.itemsPerPage = 10});

  List<T> paginate<T>(List<T> items, int page) {
    int startIndex = (page - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    if (startIndex >= items.length) {
      return [];
    }
    if (endIndex > items.length) {
      endIndex = items.length;
    }
    return items.sublist(startIndex, endIndex);
  }

  Widget buildPaginationControls({
    @required int currentPage,
    @required int totalPages,
    @required Function(int) onPageChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        Text('$currentPage / $totalPages'),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
        ),
      ],
    );
  }
}
