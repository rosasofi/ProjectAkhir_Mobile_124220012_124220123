import 'package:flutter/material.dart';

void main() {
  runApp(const KesanSaran());
}

class KesanSaran extends StatefulWidget {
  const KesanSaran({Key? key}) : super(key: key);

  @override
  State<KesanSaran> createState() => _KesanSaranState();
}

class _KesanSaranState extends State<KesanSaran> {
  // Variable to determine which content is displayed
  String selectedContent = "kesan"; // Default is "kesan"

  // Controller for the search bar
  TextEditingController searchController = TextEditingController();

  // Function to filter content based on search
  void _filterContent() {
    setState(() {
      // Check if the input contains "saran" or "kesan"
      if (searchController.text.toLowerCase().contains("saran")) {
        selectedContent = "saran";
      } else if (searchController.text.toLowerCase().contains("kesan")) {
        selectedContent = "kesan";
      } else {
        // If the input doesn't match "kesan" or "saran", set it to default (kesan)
        selectedContent = "kesan";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Add listener to the search controller
    searchController.addListener(_filterContent);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterContent);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kesan dan Saran Page",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[300],
          title: const Text(
            "Kesan dan Saran",
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  _buildSearchBar(),

                  const SizedBox(height: 20),

                  // Button Pesan & Kesan (Tombol di kiri)
                  _buildButtonRow(),

                  const SizedBox(height: 20),

                  // Lihat Voucher Saya
                  _buildVoucherText(),

                  const SizedBox(height: 20),

                  // Card with Treats Info
                  _buildTreatsCard(),

                  const SizedBox(height: 20),

                  // Kesan dan Saran Section
                  selectedContent == "kesan"
                      ? _buildKesanSaran("Kesan",
                          "Selama mengikuti mata kuliah pemrograman mobile saya mendapatkan pengalaman untuk merancang dan mengimplementasikan aplikasi mobile sederhana dari materi yang telah disampaikan sehingga memotivasi saya untuk terus belajar tentang pemrograman.")
                      : _buildKesanSaran("Saran",
                          "Saran untuk mata kuliah pemrograman kedepannya mungkin lebih diberikan contoh praktik pemrograman dikelas teori."),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Search Bar
  Widget _buildSearchBar() {
    return TextField(
      controller: searchController, // Link the controller to the search bar
      decoration: InputDecoration(
        hintText: "Punya pesan dan kesan? Lihat disini",
        hintStyle: TextStyle(color: Colors.grey[500]),
        prefixIcon: Icon(Icons.search, color: Colors.brown[300]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.brown[300]!, width: 1),
        ),
        filled: true,
        fillColor: Colors.brown[50],
      ),
    );
  }

  // Button Row for Pesan and Kesan (Posisi Kiri)
  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align buttons to the left
      children: [
        // Button Pesan
        _buildTransparentButton("Saran", "saran"),

        const SizedBox(width: 10), // Space between buttons

        // Button Kesan
        _buildTransparentButton("Kesan", "kesan"),
      ],
    );
  }

  // Fungsi untuk membuat tombol transparan dengan perubahan state saat diklik
  Widget _buildTransparentButton(String label, String contentType) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedContent = contentType; // Ubah konten yang ditampilkan
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: contentType == selectedContent
            ? Colors.brown[300]
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.brown[300]!),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Text Lihat Voucher Saya
  Widget _buildVoucherText() {
    return Text(
      "Lihat Voucher Saya",
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        color: Colors.brown[600],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Card dengan Informasi Treats
  Widget _buildTreatsCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.brown[100],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Treats COFFEE DRINK Every Day!',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown[700],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Diskon 30% Khusus Pengguna Baru Min. Belanja IDR 30K.',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.brown[600],
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Text
                Text(
                  'Berlaku sampai dengan 30 Des 2024',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.brown[500],
                  ),
                ),
                // Pakai Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MemberRegistration(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    'Join Member',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Kesan dan Saran Section
  Widget _buildKesanSaran(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [Colors.brown[200]!, Colors.brown[400]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.brown[300]!.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

// Halaman Member Registration
class MemberRegistration extends StatefulWidget {
  const MemberRegistration({Key? key}) : super(key: key);

  @override
  _MemberRegistrationState createState() => _MemberRegistrationState();
}

class _MemberRegistrationState extends State<MemberRegistration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void _showPopup(String name, String email, String phone) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 16,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 91, 73, 63),
                  Colors.brown[300]!.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 40.0,
                ),
                const SizedBox(height: 20),
                Text(
                  'Details Submitted Successfully!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Nama Lengkap: $name\nEmail: $email\nNomor Telepon: $phone',
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: const Text(
          "Formulir Registrasi Member",
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Isi data berikut untuk menjadi member:",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            // Name input field
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Email input field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Phone input field
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Nomor Telepon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                String phone = phoneController.text;

                // Show the enhanced popup dialog with user inputs
                _showPopup(name, email, phone);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}