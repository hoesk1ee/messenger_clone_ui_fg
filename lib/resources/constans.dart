import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/models/user_model.dart';

List<UserModel> userData = [
  UserModel(
    name: "Andi Lukito",
    picUrl:
        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnN8ZW58MHx8MHx8fDA%3D",
    lastOnline: "48m",
    isRead: false,
    isOnline: false,
    chat: [
      'Halo',
      'Makan yok',
    ],
    lastSent: '7:44 PM',
  ),
  UserModel(
    name: "Windah Basudara",
    picUrl:
        "https://yt3.googleusercontent.com/ZqDuYMGIahUkyQ_NadOV_oy8OrxFpBI3YHpJOQYHoUmXeJT-66aPW-UB7H_q6fjcNhkBQqZc=s900-c-k-c0x00ffffff-no-rj",
    lastOnline: "0m",
    isRead: true,
    isOnline: true,
    chat: [
      'Bro',
      'Hari ini main game apa ya?',
      'Ok ntar gua download dulu',
    ],
    lastSent: '4.23 PM',
  ),
  UserModel(
    name: "Kamado Tanjiro",
    picUrl:
        "https://cdns.klimg.com/kapanlagi.com/p/kamadotanjirosdfg4501000.jpeg",
    lastOnline: "12m",
    isRead: true,
    isOnline: false,
    chat: [
      'Bangun bro',
      'Kapan belajar?',
      "Hari ini belajar pernapasan api jurus baru",
    ],
    lastSent: '9.32 AM',
  ),
  UserModel(
    name: "Fiony Alveria Tantri",
    picUrl:
        "https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/p1/273/2023/09/01/IMG_20230901_211629-571827399.jpg",
    lastOnline: "0m",
    isRead: false,
    isOnline: true,
    chat: [
      'Gimana hari ini?',
      'Bagus deh',
      'Udah tadi siang, kamu udah?',
      'Ok met istirahat ya!',
    ],
    lastSent: '6.56 AM',
  ),
  UserModel(
    name: "Yessica Tamara Siallagan",
    picUrl:
        "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/01/2023/10/04/chikajkt48-4034482779.png",
    lastOnline: "12m",
    isRead: false,
    isOnline: false,
    chat: [
      'Eh ntar ku pergi sama cepio',
      'Mau titip salam ga?',
      'Ohiya kan bisa langsung ya',
      'Ok titip salam ya buat dia',
    ],
    lastSent: '5.23 AM',
  )
];
