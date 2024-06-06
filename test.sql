

CREATE TABLE `drinks` (
  `drinks_id` int(11) NOT NULL,
  `ice` varchar(10) DEFAULT NULL,
  `sweet` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Salary` int(10) DEFAULT NULL,
  `Lname` varchar(5) DEFAULT NULL,
  `Script` varchar(50) DEFAULT NULL,
  `Type` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `employees`
--

INSERT INTO `employees` (`EmployeeID`, `Name`, `Email`, `Birthday`, `Phone`, `Salary`, `Lname`, `Script`, `Type`) VALUES
(1001, 'John Smith', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1002, 'Jane Doe', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, 'Michael Johnson', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, 'Emily Brown', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1005, 'David Wilson', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1006, 'John Smith', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `items`
--

CREATE TABLE `items` (
  `it_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- 傾印資料表的資料 `items`
--

INSERT INTO `items` (`it_id`, `name`, `price`, `deleted`, `type`) VALUES
(1, 'Item 1', 25, 0, NULL),
(2, 'Item 2', 45, 0, NULL),
(3, 'Item 3', 20, 0, NULL),
(4, 'Item 4', 15, 1, NULL),
(5, 'Item 5', 20, 0, NULL),
(7, 'Noodle 1', 11, 0, 'N'),
(8, 'Noodle 2', 16, 0, 'N'),
(9, 'Chicken Rice', 20, 0, ''),
(10, 'Pork Rice', 20, 0, '');

-- --------------------------------------------------------

--
-- 資料表結構 `noodles`
--

CREATE TABLE `noodles` (
  `noodle_id` int(11) NOT NULL,
  `nood_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_type` varchar(16) NOT NULL DEFAULT 'Wallet',
  `total` int(11) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'Yet to be delivered',
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `description`, `date`, `payment_type`, `total`, `status`, `deleted`) VALUES
(1, 2, 'Address 2', 'Sample Description 1', '2017-03-28 17:32:41', 'Wallet', 150, 'Cancelled by Customer', 1),
(2, 2, 'New address 2', '', '2017-03-28 17:43:05', 'Wallet', 130, 'Cancelled by Customer', 1),
(3, 3, 'Address 3', 'Sample Description 2', '2017-03-28 19:49:33', 'Cash On Delivery', 130, 'Yet to be delivered', 0),
(4, 3, 'Address 3', '', '2017-03-28 19:52:01', 'Cash On Delivery', 130, 'Cancelled by Customer', 1),
(5, 3, 'New Address 3', '', '2017-03-28 20:47:28', 'Wallet', 285, 'Paused', 0),
(6, 3, 'New Address 3', '', '2017-03-30 00:43:31', 'Wallet', 325, 'Cancelled by Customer', 1),
(7, 2, 'Address 2', '', '2024-05-16 14:20:15', 'Wallet', 0, 'Yet to be delivered', 0),
(8, 2, 'swwAddress 2', '', '2024-05-16 18:00:34', 'Cash On Delivery', 25, 'Yet to be delivered', 0),
(9, 2, 'swwAddress 2', '', '2024-05-20 14:53:09', 'Cash On Delivery', 25, 'Yet to be delivered', 0),
(10, 2, 'swwAddress 2', '', '2024-05-20 15:07:33', 'Cash On Delivery', 25, 'Yet to be delivered', 0),
(11, 2, 'swwAddress 2', '', '2024-05-20 15:45:51', 'Cash On Delivery', 25, 'Yet to be delivered', 0),
(12, 2, 'swwAddress 2', '', '2024-05-20 19:40:49', 'Cash On Delivery', 25, 'Yet to be delivered', 0),
(13, 2, 'swwAddress 2', '', '2024-05-20 20:28:39', 'Cash On Delivery', 0, 'Yet to be delivered', 0),
(14, 2, 'swwAddress 2', '', '2024-05-20 20:29:19', 'Cash On Delivery', 0, 'Yet to be delivered', 0),
(15, 2, 'swwAddress 2', '', '2024-05-20 20:30:23', 'Cash On Delivery', 0, 'Yet to be delivered', 0),
(16, 2, 'swwAddress 2', '', '2024-05-20 20:33:28', 'Cash On Delivery', 50, 'Yet to be delivered', 0),
(17, 2, 'swwAddress 2', '', '2024-05-20 22:59:15', 'Cash On Delivery', 225, 'Yet to be delivered', 0),
(18, 2, 'swwAddress 2', '', '2024-05-21 19:17:07', 'Cash On Delivery', 50, 'Yet to be delivered', 0),
(19, 2, 'swwAddress 2', '', '2024-05-21 19:17:35', 'Cash On Delivery', 50, 'Yet to be delivered', 0),
(20, 2, 'swwAddress 2', '', '2024-05-21 19:18:16', 'Cash On Delivery', 25, 'Cancelled by Customer', 1),
(21, 2, 'swwAddress 2', '', '2024-05-30 16:49:47', 'Cash On Delivery', 0, 'Yet to be delivered', 0),
(22, 2, 'swwAddress 2', '', '2024-05-31 01:04:03', 'Cash On Delivery', 25, 'Yet to be delivered', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `ice` varchar(10) DEFAULT NULL,
  `sweet` varchar(10) DEFAULT NULL,
  `nood_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- 傾印資料表的資料 `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `item_id`, `quantity`, `price`, `ice`, `sweet`, `nood_type`) VALUES
(1, 1, 2, 2, 90, NULL, NULL, NULL),
(2, 1, 3, 3, 60, NULL, NULL, NULL),
(3, 2, 2, 2, 90, NULL, NULL, NULL),
(4, 2, 3, 2, 40, NULL, NULL, NULL),
(5, 3, 2, 2, 90, NULL, NULL, NULL),
(6, 3, 3, 2, 40, NULL, NULL, NULL),
(7, 4, 2, 2, 90, NULL, NULL, NULL),
(8, 4, 3, 2, 40, NULL, NULL, NULL),
(9, 5, 2, 5, 225, NULL, NULL, NULL),
(10, 5, 3, 2, 40, NULL, NULL, NULL),
(11, 5, 5, 1, 20, NULL, NULL, NULL),
(12, 6, 2, 5, 225, NULL, NULL, NULL),
(13, 6, 3, 3, 60, NULL, NULL, NULL),
(14, 6, 5, 2, 40, NULL, NULL, NULL),
(15, 8, 1, 1, 25, NULL, NULL, NULL),
(16, 9, 1, 1, 25, NULL, NULL, NULL),
(17, 10, 1, 1, 25, NULL, NULL, NULL),
(18, 11, 1, 1, 25, NULL, NULL, NULL),
(19, 12, 1, 1, 25, NULL, NULL, NULL),
(20, 16, 1, 2, 50, NULL, NULL, NULL),
(21, 17, 1, 9, 225, NULL, NULL, NULL),
(22, 18, 1, 2, 50, NULL, NULL, NULL),
(23, 19, 1, 2, 50, NULL, NULL, NULL),
(24, 20, 1, 1, 25, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Open',
  `type` varchar(30) NOT NULL DEFAULT 'Others',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- 傾印資料表的資料 `tickets`
--

INSERT INTO `tickets` (`id`, `poster_id`, `subject`, `description`, `status`, `type`, `date`, `deleted`) VALUES
(1, 2, 'Subject 1', 'New Description for Subject 1', 'Open', 'Support', '2017-03-30 18:08:51', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ticket_details`
--

CREATE TABLE `ticket_details` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- 傾印資料表的資料 `ticket_details`
--

INSERT INTO `ticket_details` (`id`, `ticket_id`, `user_id`, `description`, `date`) VALUES
(1, 1, 2, 'New Description for Subject 1', '2017-03-30 18:08:51'),
(2, 1, 2, 'Reply-1 for Subject 1', '2017-03-30 19:59:09'),
(3, 1, 1, 'Reply-2 for Subject 1 from Administrator.', '2017-03-30 20:35:39'),
(4, 1, 1, 'Reply-3 for Subject 1 from Administrator.', '2017-03-30 20:49:35');

-- --------------------------------------------------------

--
-- 資料表結構 `time`
--

CREATE TABLE `time` (
  `order_id` int(11) NOT NULL,
  `order_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `time`
--

INSERT INTO `time` (`order_id`, `order_time`) VALUES
(1, '2024-05-31 14:30:00'),
(2, '2024-01-01 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'Customer',
  `name` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `username`, `password`, `email`, `address`, `contact`, `verified`, `deleted`) VALUES
(1, 'Administrator', 'Admin 1', 'root', 'toor', '', 'Address 1', 9898000000, 1, 0),
(2, 'Customer', 'Customer 1', 'user1', '123', 'mail2@example.com', 'swwAddress 2', 9898000001, 1, 0),
(3, 'Customer', 'Customer 2', 'user2', 'pass2', 'mail3@example.com', 'Address 3', 9898000002, 1, 0),
(4, 'Customer', 'Customer 3', 'user3', 'pass3', '', '', 9898000003, 0, 0),
(5, 'Customer', 'Customer 4', 'user4', 'pass4', '', '', 9898000004, 0, 1),
(6, 'Customer', '155412', '005215', 'qwewqeqw', NULL, NULL, 450245, 0, 0),
(7, 'Customer', 'aaaaa', 'aaaaa', 'aaaaa', NULL, NULL, 11222222, 0, 0),
(8, 'Customer', '454545', '45245', '454545', NULL, NULL, 454545, 0, 0),
(9, 'Customer', '12323', 'hello', '123123', '123213', NULL, 12313, 0, 0),
(11, 'Customer', '123312', '', '123123', NULL, NULL, 123123, 0, 0),
(24, 'Customer', '12312', '12312', '123', NULL, NULL, 123123, 0, 0),
(28, 'Customer', '123123', '123123', '123213', NULL, NULL, 123123, 0, 0),
(38, 'Customer', '123445623', '34657876', '4t345', NULL, NULL, 123123, 0, 0),
(39, 'Customer', '412312', '453653', 'fwef234', NULL, NULL, 234127, 0, 0),
(41, 'Customer', '123123', '3453453', '234234', NULL, NULL, 123123123, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- 傾印資料表的資料 `wallet`
--

INSERT INTO `wallet` (`id`, `customer_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 11),
(11, 24),
(12, 28),
(13, 38),
(14, 39),
(15, 41);

-- --------------------------------------------------------

--
-- 資料表結構 `wallet_details`
--

CREATE TABLE `wallet_details` (
  `id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `number` varchar(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 2000
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- 傾印資料表的資料 `wallet_details`
--

INSERT INTO `wallet_details` (`id`, `wallet_id`, `number`, `cvv`, `balance`) VALUES
(1, 1, '6155247490533921', 983, 3430),
(2, 2, '1887587142382050', 772, 2000),
(3, 3, '4595809639046830', 532, 1585),
(4, 4, '5475856443351234', 521, 2000),
(5, 5, '9076633115663264', 229, 2000),
(6, 6, '9749680059735686', 308, 2000),
(7, 7, '18484238177198', 157, 2000),
(8, 8, '4392328992475520', 17, 2000),
(9, 9, '4460602418719822', 374, 2000),
(10, 10, '9149122572984626', 480, 2000),
(11, 11, '3182116326681051', 749, 2000),
(12, 12, '2853599347067320', 574, 2000),
(13, 13, '3054593235477069', 524, 2000),
(14, 14, '6719425934854504', 28, 2000),
(15, 15, '4772782158055166', 787, 2000);

-- --------------------------------------------------------

--
-- 資料表結構 `workschedules`
--

CREATE TABLE `workschedules` (
  `day` int(11) DEFAULT NULL,
  `Shift` varchar(50) NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `workschedules`
--

INSERT INTO `workschedules` (`day`, `Shift`, `employee_id`) VALUES
(1, 'Morning', 1001),
(2, 'Afternoon', 1002),
(3, 'Evening', 1003),
(4, 'Night', 1004),
(5, 'Morning', 1005),
(5, 'Morning', 1001),
(5, 'Morning', 1002),
(5, 'Morning', 1003);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `drinks`
--
ALTER TABLE `drinks`
  ADD PRIMARY KEY (`drinks_id`);

--
-- 資料表索引 `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- 資料表索引 `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`it_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`it_id`);

--
-- 資料表索引 `noodles`
--
ALTER TABLE `noodles`
  ADD PRIMARY KEY (`noodle_id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- 資料表索引 `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- 資料表索引 `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`order_id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 資料表索引 `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 資料表索引 `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallet_id` (`wallet_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `ticket_details`
--
ALTER TABLE `ticket_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `wallet_details`
--
ALTER TABLE `wallet_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `drinks`
--
ALTER TABLE `drinks`
  ADD CONSTRAINT `drinks_ibfk_1` FOREIGN KEY (`drinks_id`) REFERENCES `items` (`it_id`);

--
-- 資料表的限制式 `noodles`
--
ALTER TABLE `noodles`
  ADD CONSTRAINT `noodles_ibfk_1` FOREIGN KEY (`noodle_id`) REFERENCES `items` (`it_id`);

--
-- 資料表的限制式 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`it_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- 資料表的限制式 `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- 資料表的限制式 `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD CONSTRAINT `wallet_details_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
