// lib/features/booking/presentation/widgets/booking_address.dart
import 'package:flutter/material.dart';

class BookingAddress extends StatefulWidget {
  final bool dark;
  final Color neon;
  final Color card;
  final Color border;

  const BookingAddress({
    super.key,
    required this.dark,
    required this.neon,
    required this.card,
    required this.border,
  });

  @override
  State<BookingAddress> createState() => _BookingAddressState();
}

class _BookingAddressState extends State<BookingAddress> {
  String _address = "123 Apple Street, Cupertino, CA 95014";
  String _addressLabel = "Home";

  // دالة عرض Dialog لتغيير العنوان
  void _showEditAddressDialog(BuildContext context) {
    final TextEditingController addressController = TextEditingController(text: _address);
    final TextEditingController labelController = TextEditingController(text: _addressLabel);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: widget.dark ? widget.card : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(
          "Edit Address",
          style: TextStyle(
            color: widget.dark ? Colors.white : const Color(0xFF0A2E1F),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // حقل اسم العنوان (Home, Work, etc.)
            TextField(
              controller: labelController,
              style: TextStyle(
                color: widget.dark ? Colors.white : const Color(0xFF0A2E1F),
              ),
              decoration: InputDecoration(
                labelText: "Address Label",
                labelStyle: TextStyle(
                  color: widget.dark ? Colors.grey[400] : Colors.grey[600],
                ),
                hintText: "e.g. Home, Work, Office",
                hintStyle: TextStyle(
                  color: widget.dark ? Colors.grey[500] : Colors.grey[400],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: widget.dark ? widget.border : Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: widget.neon,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: widget.dark ? widget.border : Colors.grey.shade300,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            // حقل العنوان
            TextField(
              controller: addressController,
              style: TextStyle(
                color: widget.dark ? Colors.white : const Color(0xFF0A2E1F),
              ),
              decoration: InputDecoration(
                labelText: "Full Address",
                labelStyle: TextStyle(
                  color: widget.dark ? Colors.grey[400] : Colors.grey[600],
                ),
                hintText: "e.g. 123 Main Street, City, Country",
                hintStyle: TextStyle(
                  color: widget.dark ? Colors.grey[500] : Colors.grey[400],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: widget.dark ? widget.border : Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: widget.neon,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: widget.dark ? widget.border : Colors.grey.shade300,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: widget.dark ? Colors.grey[400] : Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // حفظ العنوان الجديد
              setState(() {
                if (labelController.text.isNotEmpty) {
                  _addressLabel = labelController.text;
                }
                if (addressController.text.isNotEmpty) {
                  _address = addressController.text;
                }
              });
              Navigator.pop(context);

              // عرض رسالة تأكيد
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("✅ Address updated successfully!"),
                  backgroundColor: widget.dark ? widget.neon : const Color(0xFF0A2E1F),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.dark ? widget.neon : const Color(0xFF0A2E1F),
              foregroundColor: widget.dark ? Colors.black : Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Save",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLight = !widget.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.dark ? widget.card : const Color(0xFF0A2E1F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.border.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.neon.withOpacity(0.08),
            blurRadius: 25,
            spreadRadius: 3,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(widget.dark ? 0.3 : 0.1),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.neon.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: widget.neon.withOpacity(0.1),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Icon(
              Icons.home_outlined,
              color: widget.neon,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _addressLabel,  // ✅ العنوان المتغير
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: widget.dark ? Colors.white : Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _address,  // ✅ العنوان المتغير
                  style: TextStyle(
                    fontSize: 13,
                    color: widget.dark ? Colors.grey[400] : Colors.white70,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => _showEditAddressDialog(context),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              "Change",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: widget.neon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}