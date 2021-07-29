-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2021 at 09:13 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medhealth`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_device` text NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id_category` int(11) NOT NULL,
  `category` varchar(150) NOT NULL,
  `image` text NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id_category`, `category`, `image`, `status`) VALUES
(1, 'Antibiotics', 'assets/img_antibiotics.png', 'on'),
(2, 'Vitamins', 'assets/img_vitamins.png', 'on'),
(3, 'Digestive', 'assets/img_digestive.png', 'on'),
(4, 'Skin', 'assets/img_skin.png', 'on'),
(5, 'Cough and Flu', 'assets/img_cough_flu.png', 'on'),
(6, 'Fever', 'assets/img_fever.png', 'on'),
(7, 'Antiseptics', 'assets/img_antiseptics.png', 'on'),
(8, 'Covid-19 Info', 'assets/img_covid.png', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(11) NOT NULL,
  `invoice` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `order_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id_orders` int(11) NOT NULL,
  `invoice` varchar(20) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `id_category`, `name`, `description`, `image`, `price`, `status`, `created_at`) VALUES
(1, 1, 'AMOXSAN 500 MG 10 KAPSUL', 'AMOXSAN adalah obat antibiotik yang mengandung Amoxicillin 500 mg. Amoxicillin merupakan turunan Penisilin dengan aktifitas antibakteri spektrum luas. \r\nObat ini bersifat bakterisid yang efektif terhadap bakteri Gram negatif dan Gram positif seperti Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H influenzas, E. coli, dan P. mirabiis. \r\nDalam penggunaan obat ini harus SESUAI DENGAN PETUNJUK DOKTER.', 'https://d2qjkwm11akmwu.cloudfront.net/products/a4f4d159-2e8b-4f00-8ba4-605099e3d839_product_image_url.webp', 40000, 1, '2021-04-02 09:49:21'),
(2, 1, 'ZITROLIN KAPLET 500 MG', 'ZITROLIN merupakan obat dengan kandungan Azithromycin dalam bentuk kaplet salut selaput. Azithromycin merupakan antibiotik golongan macrolide yang diberikan secara oral.\r\nMekanisme kerja dari azithromycin adalah dengan berikatan pada ribosom subunit 50 S sehingga mengganggu sintesis protein bakteri. Obat ini digunakan untuk terapi dengan infeksi ringan sampai sedang, saluran pernapasan atas dan bawah, kulit dan jaringan lunak, penyakit menular seksual. \r\nDalam penggunaan obat ini harus SESUAI DENGAN PETUNJUK DOKTER.', 'https://d2qjkwm11akmwu.cloudfront.net/products/f9bf636d-22bb-4761-9448-9d436338ee5c_product_image_url.webp', 50000, 1, '2021-04-02 09:50:38'),
(3, 1, 'AMOXSAN DRY SIRUP 60 ML', 'AMOXSAN adalah obat antibiotik yang mengandung Amoxicillin 125 mg tiap 5 ml. Amoxicillin merupakan turunan Penisilin dengan aktifitas antibakteri spektrum luas. \r\nObat ini bersifat bakterisid yang efektif terhadap bakteri Gram negatif dan Gram positif seperti Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H influenzas, E. coli, dan P. mirabiis. \r\nDalam penggunaan obat ini harus SESUAI DENGAN PETUNJUK DOKTER.', 'https://d2qjkwm11akmwu.cloudfront.net/products/cef941df-136a-41c7-b44a-449ba346da57_product_image_url.webp', 35000, 1, '2021-04-02 09:51:29'),
(4, 1, 'AMOXICILLIN 250 MG 10 KAPSUL', 'AMOXICILLIN merupakan antibiotik yang mengandung zat aktif Amoxicillin. Amoxicillin termasuk golongan antibiotik beta-lactam turunan ampicillin. \r\nObat ini digunakan pada infeksi saluran nafas atas, otitis media, bronkitis akut dan kronik, pneumonia, sistitis, uretritis, pielonefritis, bakteriuria asimptomatik pada masa hamil, gonore, infeksi kulit dan jaringan lunak. \r\nAmoxicillin memiliki spektrum mirip dengan ampisilin yaitu gram positif dan gram negatif. Bekerja dengan berikatan dengan penicillin-binding protein yang menghambat proses transpeptidation (proses cross-linking di sintesis dinding sel), mengaktivkan enzim autolisis pada dinding sel bakteri. Proses ini menyebabkan lisis dari dinding sel dan penghancuran sel bakteri. \r\nDalam penggunaan obat ini harus SESUAI DENGAN PETUNJUK DOKTER.', 'https://d2qjkwm11akmwu.cloudfront.net/products/2cdeb522-60e3-4ac7-b5f6-7a374ae52777_product_image_url.webp', 10000, 1, '2021-04-02 09:53:21'),
(5, 1, 'AMOXICILLIN SIRUP 125 MG/5 ML 60 ML', 'AMOXICILLIN SIRUP 125 MG/5 ML merupakan obat antibiotik generik turunan Penisilin dengan aktivitas antibakteri spektrum luas. \r\nObat ini bersifat bakterisid yang efektif terhadap bakteri Gram negatif dan Gram positif seperti Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H influenzas, E. coli, dan P. mirabiis. \r\nDalam penggunaan obat ini harus SESUAI DENGAN PETUNJUK DOKTER.', 'https://d2qjkwm11akmwu.cloudfront.net/products/4c1bff61-da76-49cd-a1d8-513eb75db4e4_product_image_url.webp', 18000, 1, '2021-04-02 09:54:38'),
(6, 2, 'PHARMATON FORMULA 5 KAPSUL', 'PHARMATON FORMULA merupakan kombinasi dari multivitamin, mineral dan ekstrak gingseng yang yang efektif mengurangi rasa letih, meningkatkan stamina pada saat aktivitas fisik, mendukung memori dan kemampuan belajar, serta dapat membantu menstabilkan emosi.', 'https://d2qjkwm11akmwu.cloudfront.net/products/81e69e67-a485-4a77-bab7-c9e6577b00cd_product_image_url.webp', 40000, 1, '2021-04-02 09:56:53'),
(7, 2, 'IMBOOST FORCE EXTRA STRENGTH 10 TABLET', 'IMBOOST FORCE EXTRA STRENGTH TABLET merupakan suplemen dengan kandungan Echinacea purpurea herb dry extract, Blackelderberry fruit dry extract, Zn Piccolinate dalam bentuk kaplet salut selaput. Suplemen ini digunakan untuk membantu meningkatkan serta memelihara daya tahan tubuh sehingga mencegah dari sakit dan mempercepat penyembuhan. \r\nImboost extra strength bekerja cepat mengaktifkan sistem daya tahan tubuh secara langsung di sistem pertahanan tubuh kita dengan memperbanyak antibodi sehingga daya tahan tubuh lebih kuat melawan serangan virus.', 'https://d2qjkwm11akmwu.cloudfront.net/products/bb39638d-3536-4cd7-934a-519ccc96dc4e_product_image_url.webp', 96500, 1, '2021-04-02 09:57:57'),
(8, 2, 'HOLISTICARE ESTER C 30 TABLET', 'HOLISTICARE ESTER C TABLET merupakan suplemen yang mengandung Vitamin C dalam bentuk ester, sehingga lebih aman di lambung dan penyerapannya di dalam aliran darah menjadi lebih cepat, serta bertahan di dalam tubuh 2 kali lebih lama dibandingkan dengan vitamin C biasa (dalam bentuk Asam Askorbat). \r\nKandungan vitamin C pada suplemen ini memiliki peran sebagai antioksidan bagi tubuh. Selain itu, suplemen ini digunakan untuk memelihara daya tahan tubuh, dan mengatasi gejala kekurangan vitamin C.', 'https://d2qjkwm11akmwu.cloudfront.net/products/093cc977-5cb3-44e3-b225-f233a8969faa_product_image_url.webp', 60500, 1, '2021-04-02 09:57:57'),
(9, 2, 'ENERVON-C 30 TABLET', 'ENERVON C merupakan suplemen makanan dengan kandungan multivitamin seperti Vitamin C, Vitamin B1, Vitamin B2, Vitamin B6, Vitamin B12, Vitamin D, Niasinamide, Kalsium pantotenat dalam bentuk tablet salut. \r\nSuplemen vitamin ini berguna untuk membantu menjaga daya tahan tubuh. Kombinasi vitamin C dan B komplek yang diperlukan untuk tubuh yang kekurangan vitamin, supaya daya tahan tubuh tetap terjaga serta membantu memulihkan kondisi setelah sakit.', 'https://d2qjkwm11akmwu.cloudfront.net/products/ceaa46b9-b668-4d9b-988f-909c0d42a141_product_image_url.webp', 55000, 1, '2021-04-02 10:00:05'),
(10, 2, 'REDOXON TRIPLE ACTION EFFERVESCENT 10 TABLET', 'REDOXON TRIPLE ACTION EFFERVESCENT dilengkapi dengan Vitamin D yang bekerja sama dengan Vitamin C dan Zinc, membantu menjaga daya tahan tubuh pada saat perjalanan, kondisi perubahan cuaca, dan paparan polusi. Vitamin C bermanfaat membantu daya tahan tubuh dan kesehatan serta berperan sebagai antioksidan untuk menangkal radikal bebas. \r\nVitamin D bermanfaat untuk membantu kinerja kelompok sel darah putih dalam menjaga daya tahan tubuh. Zinc membantu kinerja vitamin C, sehingga menjadi lebih efektif dalam menjaga daya tahan tubuh, dan Zinc merupakan zat yang tidak diproduksi tubuh. \r\nJika asupan dari makanan tidak mencukupi kebutuhan harian, bila perlu, dapat diberikan suplementasi.', 'https://d2qjkwm11akmwu.cloudfront.net/products/5753ee0c-1f3e-47c5-a0e0-e12d5e070001_product_image_url.webp', 38500, 1, '2021-04-02 10:00:05'),
(11, 3, 'POLYSILANE SIRUP 100 ML', 'POLYSILANE SIRUP merupakan obat maag dan anti kembung dengan kandungan Dimetilpolisiloksan, Aluminium hidroksida, dan Magnesium hidroksida dalam bentuk sirup. \r\nObat ini digunakan untuk mengurangi gejala yang berhubungan dengan kelebihan asam lambung, gastritis, tukak lambung, tukak usus 12 jari, dengan gejala-gejala seperti mual, nyeri lambung, nyeri ulu hati, kembung dan perasaan penuh pada lambung.', 'https://d2qjkwm11akmwu.cloudfront.net/products/b9b8f712-95a3-43eb-b511-e6ee9159c18c_product_image_url.webp', 25000, 1, '2021-04-02 10:04:20'),
(12, 3, 'ANTASIDA DOEN 10 TABLET', 'ANTASIDA DOEN merupakan tablet kunyah dengan kandungan Alumunium Hydroxide dan Magnesium Hydroxide. Obat ini digunakan untuk mengatasi maag dengan gejala nyeri ulu hati, sering bersendawa, dan perut kembung.', 'https://d2qjkwm11akmwu.cloudfront.net/products/e23de753-b921-4b65-b505-6480bbc29640_product_image_url.webp', 8000, 1, '2021-04-02 10:04:20'),
(13, 3, 'PROMAG 12 TABLET', 'PROMAG merupakan obat dengan kandungan Hydrotalcite, Mg(OH)2, Simethicone dalam bentuk tablet. Obat ini digunakan untuk mengurangi gejala-gejala yang berhubungan dengan: kelebihan asam lambung, gastritis, tukak lambung, tukak usus 12 jari. Gejala seperti mual, nyeri lambung, nyeri ulu hati, kembung dan perasaan penuh pada lambung.', 'https://d2qjkwm11akmwu.cloudfront.net/products/630231_1-4-2019_18-19-5.jpg', 8000, 1, '2021-04-02 10:04:20'),
(14, 4, 'DERMATIX ULTRA GEL 15 G', 'DERMATIX ULTRA GEL 15 G merupakan obat yang digunakan untuk membantu menyamarkan bahkan menghilangkan bekas luka.', 'https://d2qjkwm11akmwu.cloudfront.net/products/4e225a58-5096-40db-bc4b-45caead0ef98_product_image_url.webp', 235500, 1, '2021-04-02 10:09:16'),
(15, 4, 'KALPANAX K CREAM 5 G', 'KALPANAX K CREAM mengandung Miconazole yang merupaka obat anti jamur golongan imidazole, digunakan untuk mengobati penyakit kulit akibat infeksi jamur.', 'https://d2qjkwm11akmwu.cloudfront.net/products/968bf501-99d8-4045-849c-cc406f356077_product_image_url.webp', 27000, 1, '2021-04-02 10:09:16'),
(16, 5, 'BISOLVON EXTRA SIRUP 60 ML', 'BISOLVON EXTRA SIRUP mengandung Bromhexine HCl dan Guaifenesin. Obat ini digunakan untuk mengatasi batuk berdahak yang bekerja sebagai sekretolitik (mukolitik) dan ekspektoran untuk meredakan batuk berdahak dan mempermudah pengeluaran dahak pada saat batuk. \r\nObat ini akan membantu dengan 3 langkah kerja, yaitu: dengan Melepaskan, Mengencerkan, serta Mengeluarkan dahak, sehingga dahak dapat mudah dikeluarkan.', 'https://d2qjkwm11akmwu.cloudfront.net/products/208a7044-dbea-4614-af2d-ba4ede65ba53_product_image_url.webp', 42000, 1, '2021-04-02 10:11:34'),
(17, 5, 'OBH COMBI PLUS BATUK FLU MENTHOL 100 ML', 'OBH COMBI PLUS BATUK FLU adalah obat yang digunakan untuk meredakan batuk yang disertai gejala-gejala flu seperti demam, sakit kepala, hidung tersumbat, dan bersin-bersin. OBH Combi Plus Batuk Flu Menthol bekerja sebagai ekspektoran (membantu mengeluarkan dahak), antihistamin (mengurangi gejala alergi, analgesik-antipiretik (menurunkan panas, dmeam, dan meredakan sakit kepala), dan dekongestan hidung (melonggarkan saluran pernafasan).', 'https://d2qjkwm11akmwu.cloudfront.net/products/5c4dad7f-9fc9-4c50-bfca-35c78033c8a6_product_image_url.webp', 33500, 1, '2021-04-02 10:12:21'),
(18, 5, 'PANADOL COLD & FLU 10 KAPLET', 'PANADOL COLD & FLU merupakan obat dengan kandungan Paracetamol, Pseudoephedrine HCl, dan Dextromethorphan HBr. Obat ini dapat digunakan untuk meredakan gejala hidung tersumbat, batuk tidak berdahak, dan demam yang menyertai flu.', 'https://d2qjkwm11akmwu.cloudfront.net/products/f263dead-9753-4520-a07f-b4aaec689d2c_product_image_url.webp', 25000, 1, '2021-04-02 10:12:21'),
(19, 6, 'PARACETAMOL 500 MG 10 KAPLET', 'PARACETAMOL TABLET merupakan obat yang dapat digunakan untuk meringankan rasa sakit pada sakit kepala, sakit gigi, dan menurunkan demam. Paracetamol sebagai analgetik, bekerja dengan meningkatkan ambang rasa sakit dan sebagai antipiretik yang diduga bekerja langsung pada pusat pengatur panas di hipotalamus.', 'https://d2qjkwm11akmwu.cloudfront.net/products/de2e8223-2622-4861-a47f-64b14e8ed8d5_product_image_url.webp', 10000, 1, '2021-04-02 10:14:23'),
(20, 6, 'KOOLFEVER FOR ADULT 1 SACHET', 'KOOLFEVER ADULT merupakan plester kompres penurun panas dan pereda nyeri, serta dapat memberikan efek dingin di saat cuaca panas pada orang dewasa. Plester ini dapat memberikan sensasi dingin hingga 8 jam.', 'https://d2qjkwm11akmwu.cloudfront.net/products/8f3609e7-20ca-468f-a7ac-8d3360ece9d0_product_image_url.webp', 18000, 1, '2021-04-02 10:14:23'),
(21, 6, 'IBUPROFEN 400 MG 10 TABLET', 'IBUPROFEN merupakan obat generik dimana pada kadar 400 mg atau lebih digunakan untuk rasa nyeri dan inflamasi sebagai gejala utama. Obat ini digunakan sebagai analgesik yaitu untuk meringankan nyeri ringan sampai sedang antara lain nyeri pada sakit kepala, nyeri haid, nyeri pada penyakit gigi atau pencabutan gigi, dan nyeri setelah operasi. \r\nSelain itu, obat ini digunakan sebagai analgesik dan anti inflamasi dengan meringankan gejala-gejala penyakit rematik tulang, sendi dan non sendi, meringankan gejala-gejala akibat trauma otot dan tulang/sendi. Ibuprofen adalah golongan obat anti inflamasi non steroid yang mempunyai efek anti inflamasi, analgesik dan antipiretik. Obat ini bekerja dengan cara menghambat prostaglandin. \r\nDalam penggunaan obat ini harus SESUAI DENGAN PETUNJUK DOKTER.', 'https://d2qjkwm11akmwu.cloudfront.net/products/7689ed7d-1187-46a8-b919-978989e010ea_product_image_url.webp', 12500, 1, '2021-04-02 10:15:54'),
(22, 7, 'BETADINE SKIN CLEANSER ANTISEPTIC 100 ML', 'BETADINE SKIN CLEANSER ANTISEPTIC 100 ML sabun cair antiseptik yang mengandung Povidon iodine 7,5% untuk mengatasi masalah pada kulit seperti jerawat dan gatal-gatal, disinfeksi tangan sebelum operasi, dan menjaga kesehatan kulit.', 'https://d2qjkwm11akmwu.cloudfront.net/products/bc8da276-31b7-4148-9254-5229e3d25dea_product_image_url.webp', 45000, 1, '2021-04-02 10:17:36'),
(23, 7, 'DETTOL ANTISEPTIK CAIR 245 ML', 'DETTOL ANTISEPTIK CAIR merupakan antiseptik cair yang digunakan sebagai perlindungan dari penyakit yang disebabkan kuman. Cairan ini juga dapat digunakan untuk mempercepat penyembuhan luka, lecet, gigitan, sengatan serangga, membunuh kuman pada pakaian kotor dan sebagai disinfektan pada peralatan rumah tangga.', 'https://d2qjkwm11akmwu.cloudfront.net/products/02ac32c9-de61-4d68-91cf-92b4ed77525d_product_image_url.webp', 55000, 1, '2021-04-02 10:17:36'),
(24, 7, 'ANTIS JERUK NIPIS SPRAY 55 ML', 'ANTIS JERUK NIPIS SPRAY 55 ML merupakan pembersih tangan dalam bentuk spray dengan aroma jeruk nipis yang mengandung moisturaizer yang dapat melembabkan kulit dan dapat membunuh kuman.', 'https://d2qjkwm11akmwu.cloudfront.net/products/d138f207-6671-4d53-b372-497cc51a265d_product_image_url.webp', 15000, 1, '2021-04-02 10:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `password` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `fullName`, `email`, `phone`, `address`, `password`, `created_at`, `status`) VALUES
(1, 'Wahyu Nugroho', 'wahyunugroho@gmail.com', '085819980891', 'JL G Raya No 34', '25d55ad283aa400af464c76d713c07ad', '2021-04-04 00:30:27', 1),
(4, 'user3', 'Test3@gmail.com', '11111', 'jl user 1 texas', '12345678', '2021-07-27 15:42:40', 1),
(5, 'aji', 'wahyunugroho11@gmail.com', '878908', 'hjksnfdjksndkj', 'aji123', '2021-07-27 21:12:35', 1),
(6, 'ajis', 'ajis@gmail.com', '12345', 'ciputat', 'ajis123', '2021-07-27 21:34:55', 1),
(7, 'Adit', 'adit@gmail.com', '087787119729', 'Jl.Mawar no 9,Ciputat', 'adit123', '2021-07-27 23:03:06', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category_product` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
