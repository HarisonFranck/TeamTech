import 'package:flutter/material.dart';
import 'package:responsive_app/Component/SideBar.dart';

final listSelectionner = [
  true,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<String> listSideBarTitles = [
  "Dashboard",
  "Project",
  "Messages",
  "Events",
  "Employees",
  "Reports",
  "Payments",
  "Settings",
];

List<Icon> listSideBarIcons = [
  const Icon(
    Icons.dashboard,
    color: Colors.white,
  ),
  const Icon(
    Icons.bar_chart_sharp,
    color: Colors.white,
  ),
  const Icon(
    Icons.message,
    color: Colors.white,
  ),
  const Icon(
    Icons.event,
    color: Colors.white,
  ),
  const Icon(
    Icons.groups_3,
    color: Colors.white,
  ),
  const Icon(
    Icons.document_scanner,
    color: Colors.white,
  ),
  const Icon(
    Icons.payment,
    color: Colors.white,
  ),
  const Icon(
    Icons.settings,
    color: Colors.white,
  ),
];

List<SideBar> listSideBars = [
  SideBar(
    sideBarTitles: listSideBarTitles[0],
    sideBarIcons: listSideBarIcons[0],
    selected: listSelectionner[0],
  ),
  SideBar(
    sideBarTitles: listSideBarTitles[1],
    sideBarIcons: listSideBarIcons[1],
    selected: listSelectionner[1],
  ),
  SideBar(
    sideBarTitles: listSideBarTitles[2],
    sideBarIcons: listSideBarIcons[2],
    selected: listSelectionner[2],
  ),
  SideBar(
    sideBarTitles: listSideBarTitles[3],
    sideBarIcons: listSideBarIcons[3],
    selected: listSelectionner[3],
  ),
  SideBar(
    sideBarTitles: listSideBarTitles[4],
    sideBarIcons: listSideBarIcons[4],
    selected: listSelectionner[4],
  ),
  SideBar(
    sideBarTitles: listSideBarTitles[5],
    sideBarIcons: listSideBarIcons[5],
    selected: listSelectionner[5],
  ),
  SideBar(
    sideBarTitles: listSideBarTitles[6],
    sideBarIcons: listSideBarIcons[6],
    selected: listSelectionner[6],
  ),
];
