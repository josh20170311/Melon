CREATE DATABASE  IF NOT EXISTS `myproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myproject`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: myproject
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `articleId` int unsigned NOT NULL AUTO_INCREMENT,
  `articleTitle` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articleContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articleUploadTime` datetime NOT NULL,
  `articleProductId` int NOT NULL,
  `articleAuthorId` int NOT NULL,
  PRIMARY KEY (`articleId`),
  UNIQUE KEY `articleId_UNIQUE` (`articleId`),
  KEY `a_idx` (`articleAuthorId`),
  KEY `b_idx` (`articleProductId`),
  CONSTRAINT `a` FOREIGN KEY (`articleAuthorId`) REFERENCES `user` (`id`),
  CONSTRAINT `b` FOREIGN KEY (`articleProductId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (105,'開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！','三月份的時候宇恩才寫了一篇關於「創作者筆電」的專題文章，告訴大家會有越來越多筆電去針對設計師、動畫師、建模師等專業工作者這塊領域推出！而華碩可說是早已備好旗下的 ProArt StudioBook 系列筆電要來應戰這股創作者新勢力啦！\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n今天宇恩要開箱的「ASUS ProArt StudioBook Pro 17 (W700)」在系列中屬於中高階的定位，如果平常有需要跑像是 Cinema 4D、MAYA、AutoCAD 等較複雜的 3D 繪圖/建模軟體的大家，可千萬不要錯過這位實力派帥哥喔！接下來宇恩會分別依照它的外型、規格、性能實測來帶大家好好認識它一下～\r\n\r\n精實幹練的西裝帥哥\r\n宇恩覺得 ASUS ProArt StudioBook Pro 17 就像一個穿著星空灰色西裝、給人一種時尚穩重、又很有安全感的商務帥哥！鋁鎂合金的機身、上蓋採用斜髮絲紋設計、擺動到不同角度光澤感也會隨之變化，隱隱約約就像在對你拋媚眼一樣?\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n鑽石切割的邊緣也給人一種俐落感，接近轉軸的地方還有一條玫瑰金色細線作點綴\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n然後如果仔細看的話會發現，打開來在 C 面下方的觸控板處，一樣也有做斜髮絲紋＋玫瑰金色細線相呼應的設計！這位小帥哥連細節都不放過的這點我好感度先加 10 分！\r\n\r\n▼然後一定要說一下這個指紋辨識鍵十分靈敏，一放上去就可以快速登入，非常方便\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n再來這次 ASUS ProArt StudioBook Pro 17 採用的是 NumberPad 虛擬數字觸控板，只要長按右上角的按鈕就可以叫出 LED 虛擬數字鍵盤，而且啟用數字鍵的同時觸控板的游標功能依舊是有支援的唷\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n另一個小巧思是它的電源鍵，啟動之後上面那道橫切線是會發光的喔～有一種迅速為筆電注入能量的感覺，全尺寸背光鍵盤有三段式背光可以調整，按鍵鍵程為 1.4mm，有軟 Q 的回饋感，打起來我個人覺得也滿安靜的，如果有需要帶著筆電出門也不用擔心會吵到別人\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n漂亮又耐看的臉蛋\r\n接著來看一下 ASUS ProArt StudioBook Pro 17 的螢幕，我跟你們說，這位西裝帥哥的臉蛋也是會讓人豎大姆哥的喔！\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n17 吋的大螢幕，解析度為 1920x1200，不僅經過 Pantone 認證、還有 8 bit 色彩深度、97% DCI-P3 廣色域，可以呈現出更豐富、更多層次的顏色、以及 Delta E < 1.5，代表越精準、越接近真實的色彩，畢竟創作者們所有的作品都和螢幕表現息息相關嘛～所以除了螢幕解析度高之外，顏色的廣度及正確性也非常重要！\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n另外 ASUS ProArt StudioBook Pro 17 採用 NanoEdge 三邊窄邊框設計、16:10 的螢幕比例，不只整體的視覺效果更廣，也加大了可以使用的空間，而且還能 180 度攤平，需要開會討論或是做作品展示的時候就能派上用場啦\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n快又準的交際手腕\r\n接下來要帶大家看一下 ASUS ProArt StudioBook Pro 17 兩側的接孔，我覺得如果要比喻的話，一台筆電的連接埠是否齊全就如同一個人是否具備一定程度的交際手腕一樣，畢竟都代表著要和自身以外的事物相互連接、或是互助合作達到加乘的效果嘛～(笑)\r\n\r\n宇恩檢視下來，我覺得這位西裝帥哥應該可算是高手等級的了，在機身左側依序有電源孔、Thunderbolt 3 USB-C 接孔、HDMI、USB 3.1 Gen 2、3.5mm 耳機孔和 SD 4.0 卡槽；右側的話則是有兩個 USB 3.1 Gen 2，基本上該具備的都有了，而且還不是一般的規格而已\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n例如 Thunderbolt 3 除了有更快的傳輸速度之外，還能直接外接顯卡或是螢幕來替創作者們完成更多進階的工作；還有 SD 4.0 卡槽也要提一下，我覺得本身有附卡槽就已經超實用了，加上它相較於前一代的規格在傳檔速度又快了至少三倍，所以對於像攝影師、導演們來說，以後拍完照片、影片等檔案，就可以直接在筆電上快速的讀取，省下了帶外接連接埠還有等候的時間啦～\r\n\r\n內在也是硬底子\r\nASUS ProArt StudioBook Pro 17 的規格也是十分強悍，宇恩手上的這台 W700G2T配備 Intel Core i7-9750H 處理器、NVIDIA Quadro T2000 的顯卡，這張是專業的繪圖卡，可以確保創作者們在製作過程中還有最後輸出的重要時刻不會突然當掉、卡頓或是出任何差錯！記憶體高達 32GB，可以流暢的進行多工處理、還有 1TB 儲存空間，採用 PCIEG3 x4 的 SSD 以 carry 各種創作軟體，對創作者們來說也是超高規格啊～而且還有通過 ISV 認證，確保軟硬體的相容性，另外還支援 Wi-Fi 6、藍牙 5.0，提高無線傳輸效率、以及符合 MIL-STD-810G 軍規標準\r\n\r\n實力展現 showtime\r\n這次宇恩實際用 Cinema 4D 這個繪圖軟體來實測 ProArt StudioBook Pro 17 的效能，現在秀給大家看的是建模中的畫面，我們正在製作一個玻璃球搖晃，然後裡頭會雪花紛飛的動畫，聽起來好像很簡單，但你們知道其實要算的東西超級多嗎？裡頭的每一個雪花粒子，從搖動、飄起到碰壁反彈，這些全部都要花電腦的效能單獨運算的，很不容易啊～\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n操作的時候用起來也都很順暢，不管是要換玻璃球的素材、調整視角等等都是同步的，整個效率很讚 (設計師獺獺投以羨慕的眼神?)，然後這個看似短短的動畫其實共有兩百多張圖，最後做完輸出大概要六個小時 (在此向各個動畫師致上最高敬意)，但這個速度算很快了，大概比我們家設計師獺獺的筆電快 1.5~2 倍哈哈哈，而這省下來的時間也代表設計師或創作者們可以去進行更多的創作啦\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n除了複雜的 3D 軟體之外，一般的 PS 修圖、AE 做動態特效等等的當然也都難不倒它～ \r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n然後有一點宇恩一定要提，就是整台筆電真的很安靜 (小於 35db)，平常完全沒聲音，只有在做動畫輸出的時候，靠很近才會聽到很細微在運轉的聲音，這令我滿驚豔的，如果是一般的筆電應該都已經飛起來了吧?另外底部採用了雙風扇設計，除了可以加強散熱，還能確保在 CPU 和 GPU 強效發揮下雙燒不降頻喔！\r\n\r\n小結\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n這陣子體驗華碩 ProArt StudioBook Pro 17 下來，有三個令我印象深刻的點，一、螢幕超大超漂亮、用起來很過癮；二、非常安靜；三、實測各種軟體都好順，創作者們在意的點的都包進整台筆電裡了！如果獺友們有做設計、動畫等等這類專業領域的需求，不妨可以參考看看，或是想要找更高規格的也可以看看 W700G3T，而且現在全系列還有三年保固唷！最後也附上 W700 全系列三台的規格表給大家看一下比較囉～\r\n\r\n開箱｜華碩『 ASUS ProArt StudioBook Pro 17 (W700) 』，製作 3D 動畫高效又穩定，創作者在意的點全包了！\r\n\r\n?誰還沒有追蹤電獺少女 Instagram？每天都有新貼文、每週都開新話題等你來跟編輯聊天，電獺少女 Instagram 新鮮事一起來玩！','2020-05-19 19:02:12',1,25);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(50) CHARACTER SET latin1 NOT NULL,
  `category` varchar(50) CHARACTER SET latin1 NOT NULL,
  `featured` varchar(50) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'One Plus 6','12000','One Plus','yes','img/oneplus-6.jpg'),(2,'iPhoneX (256 G)','41500','Apple','yes','img/iphone-x.jpeg'),(3,'Pocophone F1','10999','Xiaomi','yes','img/pocophone-f1.jpg'),(4,'Samsung S9','25500','Samsung','yes','img/samsung-s9.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `address` text CHARACTER SET latin1 NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (25,'test','test','test@test','test','testtest');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20 12:45:08
