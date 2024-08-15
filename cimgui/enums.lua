local path = (...):gsub("[^%.]*$", "")
local M = require(path .. "master")

M.ImDrawFlags_None = 0
M.ImDrawFlags_Closed = 1
M.ImDrawFlags_RoundCornersTopLeft = 16
M.ImDrawFlags_RoundCornersTopRight = 32
M.ImDrawFlags_RoundCornersBottomLeft = 64
M.ImDrawFlags_RoundCornersBottomRight = 128
M.ImDrawFlags_RoundCornersNone = 256
M.ImDrawFlags_RoundCornersTop = 48
M.ImDrawFlags_RoundCornersBottom = 192
M.ImDrawFlags_RoundCornersLeft = 80
M.ImDrawFlags_RoundCornersRight = 160
M.ImDrawFlags_RoundCornersAll = 240
M.ImDrawFlags_RoundCornersDefault_ = 240
M.ImDrawFlags_RoundCornersMask_ = 496
M.ImDrawListFlags_None = 0
M.ImDrawListFlags_AntiAliasedLines = 1
M.ImDrawListFlags_AntiAliasedLinesUseTex = 2
M.ImDrawListFlags_AntiAliasedFill = 4
M.ImDrawListFlags_AllowVtxOffset = 8
M.ImFontAtlasFlags_None = 0
M.ImFontAtlasFlags_NoPowerOfTwoHeight = 1
M.ImFontAtlasFlags_NoMouseCursors = 2
M.ImFontAtlasFlags_NoBakedLines = 4
M.ImGuiBackendFlags_None = 0
M.ImGuiBackendFlags_HasGamepad = 1
M.ImGuiBackendFlags_HasMouseCursors = 2
M.ImGuiBackendFlags_HasSetMousePos = 4
M.ImGuiBackendFlags_RendererHasVtxOffset = 8
M.ImGuiBackendFlags_PlatformHasViewports = 1024
M.ImGuiBackendFlags_HasMouseHoveredViewport = 2048
M.ImGuiBackendFlags_RendererHasViewports = 4096
M.ImGuiButtonFlags_None = 0
M.ImGuiButtonFlags_MouseButtonLeft = 1
M.ImGuiButtonFlags_MouseButtonRight = 2
M.ImGuiButtonFlags_MouseButtonMiddle = 4
M.ImGuiButtonFlags_MouseButtonMask_ = 7
M.ImGuiChildFlags_None = 0
M.ImGuiChildFlags_Border = 1
M.ImGuiChildFlags_AlwaysUseWindowPadding = 2
M.ImGuiChildFlags_ResizeX = 4
M.ImGuiChildFlags_ResizeY = 8
M.ImGuiChildFlags_AutoResizeX = 16
M.ImGuiChildFlags_AutoResizeY = 32
M.ImGuiChildFlags_AlwaysAutoResize = 64
M.ImGuiChildFlags_FrameStyle = 128
M.ImGuiChildFlags_NavFlattened = 256
M.ImGuiCol_Text = 0
M.ImGuiCol_TextDisabled = 1
M.ImGuiCol_WindowBg = 2
M.ImGuiCol_ChildBg = 3
M.ImGuiCol_PopupBg = 4
M.ImGuiCol_Border = 5
M.ImGuiCol_BorderShadow = 6
M.ImGuiCol_FrameBg = 7
M.ImGuiCol_FrameBgHovered = 8
M.ImGuiCol_FrameBgActive = 9
M.ImGuiCol_TitleBg = 10
M.ImGuiCol_TitleBgActive = 11
M.ImGuiCol_TitleBgCollapsed = 12
M.ImGuiCol_MenuBarBg = 13
M.ImGuiCol_ScrollbarBg = 14
M.ImGuiCol_ScrollbarGrab = 15
M.ImGuiCol_ScrollbarGrabHovered = 16
M.ImGuiCol_ScrollbarGrabActive = 17
M.ImGuiCol_CheckMark = 18
M.ImGuiCol_SliderGrab = 19
M.ImGuiCol_SliderGrabActive = 20
M.ImGuiCol_Button = 21
M.ImGuiCol_ButtonHovered = 22
M.ImGuiCol_ButtonActive = 23
M.ImGuiCol_Header = 24
M.ImGuiCol_HeaderHovered = 25
M.ImGuiCol_HeaderActive = 26
M.ImGuiCol_Separator = 27
M.ImGuiCol_SeparatorHovered = 28
M.ImGuiCol_SeparatorActive = 29
M.ImGuiCol_ResizeGrip = 30
M.ImGuiCol_ResizeGripHovered = 31
M.ImGuiCol_ResizeGripActive = 32
M.ImGuiCol_TabHovered = 33
M.ImGuiCol_Tab = 34
M.ImGuiCol_TabSelected = 35
M.ImGuiCol_TabSelectedOverline = 36
M.ImGuiCol_TabDimmed = 37
M.ImGuiCol_TabDimmedSelected = 38
M.ImGuiCol_TabDimmedSelectedOverline = 39
M.ImGuiCol_DockingPreview = 40
M.ImGuiCol_DockingEmptyBg = 41
M.ImGuiCol_PlotLines = 42
M.ImGuiCol_PlotLinesHovered = 43
M.ImGuiCol_PlotHistogram = 44
M.ImGuiCol_PlotHistogramHovered = 45
M.ImGuiCol_TableHeaderBg = 46
M.ImGuiCol_TableBorderStrong = 47
M.ImGuiCol_TableBorderLight = 48
M.ImGuiCol_TableRowBg = 49
M.ImGuiCol_TableRowBgAlt = 50
M.ImGuiCol_TextLink = 51
M.ImGuiCol_TextSelectedBg = 52
M.ImGuiCol_DragDropTarget = 53
M.ImGuiCol_NavHighlight = 54
M.ImGuiCol_NavWindowingHighlight = 55
M.ImGuiCol_NavWindowingDimBg = 56
M.ImGuiCol_ModalWindowDimBg = 57
M.ImGuiCol_COUNT = 58
M.ImGuiColorEditFlags_None = 0
M.ImGuiColorEditFlags_NoAlpha = 2
M.ImGuiColorEditFlags_NoPicker = 4
M.ImGuiColorEditFlags_NoOptions = 8
M.ImGuiColorEditFlags_NoSmallPreview = 16
M.ImGuiColorEditFlags_NoInputs = 32
M.ImGuiColorEditFlags_NoTooltip = 64
M.ImGuiColorEditFlags_NoLabel = 128
M.ImGuiColorEditFlags_NoSidePreview = 256
M.ImGuiColorEditFlags_NoDragDrop = 512
M.ImGuiColorEditFlags_NoBorder = 1024
M.ImGuiColorEditFlags_AlphaBar = 65536
M.ImGuiColorEditFlags_AlphaPreview = 131072
M.ImGuiColorEditFlags_AlphaPreviewHalf = 262144
M.ImGuiColorEditFlags_HDR = 524288
M.ImGuiColorEditFlags_DisplayRGB = 1048576
M.ImGuiColorEditFlags_DisplayHSV = 2097152
M.ImGuiColorEditFlags_DisplayHex = 4194304
M.ImGuiColorEditFlags_Uint8 = 8388608
M.ImGuiColorEditFlags_Float = 16777216
M.ImGuiColorEditFlags_PickerHueBar = 33554432
M.ImGuiColorEditFlags_PickerHueWheel = 67108864
M.ImGuiColorEditFlags_InputRGB = 134217728
M.ImGuiColorEditFlags_InputHSV = 268435456
M.ImGuiColorEditFlags_DefaultOptions_ = 177209344
M.ImGuiColorEditFlags_DisplayMask_ = 7340032
M.ImGuiColorEditFlags_DataTypeMask_ = 25165824
M.ImGuiColorEditFlags_PickerMask_ = 100663296
M.ImGuiColorEditFlags_InputMask_ = 402653184
M.ImGuiComboFlags_None = 0
M.ImGuiComboFlags_PopupAlignLeft = 1
M.ImGuiComboFlags_HeightSmall = 2
M.ImGuiComboFlags_HeightRegular = 4
M.ImGuiComboFlags_HeightLarge = 8
M.ImGuiComboFlags_HeightLargest = 16
M.ImGuiComboFlags_NoArrowButton = 32
M.ImGuiComboFlags_NoPreview = 64
M.ImGuiComboFlags_WidthFitPreview = 128
M.ImGuiComboFlags_HeightMask_ = 30
M.ImGuiCond_None = 0
M.ImGuiCond_Always = 1
M.ImGuiCond_Once = 2
M.ImGuiCond_FirstUseEver = 4
M.ImGuiCond_Appearing = 8
M.ImGuiConfigFlags_None = 0
M.ImGuiConfigFlags_NavEnableKeyboard = 1
M.ImGuiConfigFlags_NavEnableGamepad = 2
M.ImGuiConfigFlags_NavEnableSetMousePos = 4
M.ImGuiConfigFlags_NavNoCaptureKeyboard = 8
M.ImGuiConfigFlags_NoMouse = 16
M.ImGuiConfigFlags_NoMouseCursorChange = 32
M.ImGuiConfigFlags_NoKeyboard = 64
M.ImGuiConfigFlags_DockingEnable = 128
M.ImGuiConfigFlags_ViewportsEnable = 1024
M.ImGuiConfigFlags_DpiEnableScaleViewports = 16384
M.ImGuiConfigFlags_DpiEnableScaleFonts = 32768
M.ImGuiConfigFlags_IsSRGB = 1048576
M.ImGuiConfigFlags_IsTouchScreen = 2097152
M.ImGuiDataType_S8 = 0
M.ImGuiDataType_U8 = 1
M.ImGuiDataType_S16 = 2
M.ImGuiDataType_U16 = 3
M.ImGuiDataType_S32 = 4
M.ImGuiDataType_U32 = 5
M.ImGuiDataType_S64 = 6
M.ImGuiDataType_U64 = 7
M.ImGuiDataType_Float = 8
M.ImGuiDataType_Double = 9
M.ImGuiDataType_Bool = 10
M.ImGuiDataType_COUNT = 11
M.ImGuiDir_None = -1
M.ImGuiDir_Left = 0
M.ImGuiDir_Right = 1
M.ImGuiDir_Up = 2
M.ImGuiDir_Down = 3
M.ImGuiDir_COUNT = 4
M.ImGuiDockNodeFlags_None = 0
M.ImGuiDockNodeFlags_KeepAliveOnly = 1
M.ImGuiDockNodeFlags_NoDockingOverCentralNode = 4
M.ImGuiDockNodeFlags_PassthruCentralNode = 8
M.ImGuiDockNodeFlags_NoDockingSplit = 16
M.ImGuiDockNodeFlags_NoResize = 32
M.ImGuiDockNodeFlags_AutoHideTabBar = 64
M.ImGuiDockNodeFlags_NoUndocking = 128
M.ImGuiDragDropFlags_None = 0
M.ImGuiDragDropFlags_SourceNoPreviewTooltip = 1
M.ImGuiDragDropFlags_SourceNoDisableHover = 2
M.ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 4
M.ImGuiDragDropFlags_SourceAllowNullID = 8
M.ImGuiDragDropFlags_SourceExtern = 16
M.ImGuiDragDropFlags_PayloadAutoExpire = 32
M.ImGuiDragDropFlags_PayloadNoCrossContext = 64
M.ImGuiDragDropFlags_PayloadNoCrossProcess = 128
M.ImGuiDragDropFlags_AcceptBeforeDelivery = 1024
M.ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 2048
M.ImGuiDragDropFlags_AcceptNoPreviewTooltip = 4096
M.ImGuiDragDropFlags_AcceptPeekOnly = 3072
M.ImGuiFocusedFlags_None = 0
M.ImGuiFocusedFlags_ChildWindows = 1
M.ImGuiFocusedFlags_RootWindow = 2
M.ImGuiFocusedFlags_AnyWindow = 4
M.ImGuiFocusedFlags_NoPopupHierarchy = 8
M.ImGuiFocusedFlags_DockHierarchy = 16
M.ImGuiFocusedFlags_RootAndChildWindows = 3
M.ImGuiHoveredFlags_None = 0
M.ImGuiHoveredFlags_ChildWindows = 1
M.ImGuiHoveredFlags_RootWindow = 2
M.ImGuiHoveredFlags_AnyWindow = 4
M.ImGuiHoveredFlags_NoPopupHierarchy = 8
M.ImGuiHoveredFlags_DockHierarchy = 16
M.ImGuiHoveredFlags_AllowWhenBlockedByPopup = 32
M.ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 128
M.ImGuiHoveredFlags_AllowWhenOverlappedByItem = 256
M.ImGuiHoveredFlags_AllowWhenOverlappedByWindow = 512
M.ImGuiHoveredFlags_AllowWhenDisabled = 1024
M.ImGuiHoveredFlags_NoNavOverride = 2048
M.ImGuiHoveredFlags_AllowWhenOverlapped = 768
M.ImGuiHoveredFlags_RectOnly = 928
M.ImGuiHoveredFlags_RootAndChildWindows = 3
M.ImGuiHoveredFlags_ForTooltip = 4096
M.ImGuiHoveredFlags_Stationary = 8192
M.ImGuiHoveredFlags_DelayNone = 16384
M.ImGuiHoveredFlags_DelayShort = 32768
M.ImGuiHoveredFlags_DelayNormal = 65536
M.ImGuiHoveredFlags_NoSharedDelay = 131072
M.ImGuiInputFlags_None = 0
M.ImGuiInputFlags_Repeat = 1
M.ImGuiInputFlags_RouteActive = 1024
M.ImGuiInputFlags_RouteFocused = 2048
M.ImGuiInputFlags_RouteGlobal = 4096
M.ImGuiInputFlags_RouteAlways = 8192
M.ImGuiInputFlags_RouteOverFocused = 16384
M.ImGuiInputFlags_RouteOverActive = 32768
M.ImGuiInputFlags_RouteUnlessBgFocused = 65536
M.ImGuiInputFlags_RouteFromRootWindow = 131072
M.ImGuiInputFlags_Tooltip = 262144
M.ImGuiInputTextFlags_None = 0
M.ImGuiInputTextFlags_CharsDecimal = 1
M.ImGuiInputTextFlags_CharsHexadecimal = 2
M.ImGuiInputTextFlags_CharsScientific = 4
M.ImGuiInputTextFlags_CharsUppercase = 8
M.ImGuiInputTextFlags_CharsNoBlank = 16
M.ImGuiInputTextFlags_AllowTabInput = 32
M.ImGuiInputTextFlags_EnterReturnsTrue = 64
M.ImGuiInputTextFlags_EscapeClearsAll = 128
M.ImGuiInputTextFlags_CtrlEnterForNewLine = 256
M.ImGuiInputTextFlags_ReadOnly = 512
M.ImGuiInputTextFlags_Password = 1024
M.ImGuiInputTextFlags_AlwaysOverwrite = 2048
M.ImGuiInputTextFlags_AutoSelectAll = 4096
M.ImGuiInputTextFlags_ParseEmptyRefVal = 8192
M.ImGuiInputTextFlags_DisplayEmptyRefVal = 16384
M.ImGuiInputTextFlags_NoHorizontalScroll = 32768
M.ImGuiInputTextFlags_NoUndoRedo = 65536
M.ImGuiInputTextFlags_CallbackCompletion = 131072
M.ImGuiInputTextFlags_CallbackHistory = 262144
M.ImGuiInputTextFlags_CallbackAlways = 524288
M.ImGuiInputTextFlags_CallbackCharFilter = 1048576
M.ImGuiInputTextFlags_CallbackResize = 2097152
M.ImGuiInputTextFlags_CallbackEdit = 4194304
M.ImGuiItemFlags_None = 0
M.ImGuiItemFlags_NoTabStop = 1
M.ImGuiItemFlags_NoNav = 2
M.ImGuiItemFlags_NoNavDefaultFocus = 4
M.ImGuiItemFlags_ButtonRepeat = 8
M.ImGuiItemFlags_AutoClosePopups = 16
M.ImGuiKey_None = 0
M.ImGuiKey_Tab = 512
M.ImGuiKey_LeftArrow = 513
M.ImGuiKey_RightArrow = 514
M.ImGuiKey_UpArrow = 515
M.ImGuiKey_DownArrow = 516
M.ImGuiKey_PageUp = 517
M.ImGuiKey_PageDown = 518
M.ImGuiKey_Home = 519
M.ImGuiKey_End = 520
M.ImGuiKey_Insert = 521
M.ImGuiKey_Delete = 522
M.ImGuiKey_Backspace = 523
M.ImGuiKey_Space = 524
M.ImGuiKey_Enter = 525
M.ImGuiKey_Escape = 526
M.ImGuiKey_LeftCtrl = 527
M.ImGuiKey_LeftShift = 528
M.ImGuiKey_LeftAlt = 529
M.ImGuiKey_LeftSuper = 530
M.ImGuiKey_RightCtrl = 531
M.ImGuiKey_RightShift = 532
M.ImGuiKey_RightAlt = 533
M.ImGuiKey_RightSuper = 534
M.ImGuiKey_Menu = 535
M.ImGuiKey_0 = 536
M.ImGuiKey_1 = 537
M.ImGuiKey_2 = 538
M.ImGuiKey_3 = 539
M.ImGuiKey_4 = 540
M.ImGuiKey_5 = 541
M.ImGuiKey_6 = 542
M.ImGuiKey_7 = 543
M.ImGuiKey_8 = 544
M.ImGuiKey_9 = 545
M.ImGuiKey_A = 546
M.ImGuiKey_B = 547
M.ImGuiKey_C = 548
M.ImGuiKey_D = 549
M.ImGuiKey_E = 550
M.ImGuiKey_F = 551
M.ImGuiKey_G = 552
M.ImGuiKey_H = 553
M.ImGuiKey_I = 554
M.ImGuiKey_J = 555
M.ImGuiKey_K = 556
M.ImGuiKey_L = 557
M.ImGuiKey_M = 558
M.ImGuiKey_N = 559
M.ImGuiKey_O = 560
M.ImGuiKey_P = 561
M.ImGuiKey_Q = 562
M.ImGuiKey_R = 563
M.ImGuiKey_S = 564
M.ImGuiKey_T = 565
M.ImGuiKey_U = 566
M.ImGuiKey_V = 567
M.ImGuiKey_W = 568
M.ImGuiKey_X = 569
M.ImGuiKey_Y = 570
M.ImGuiKey_Z = 571
M.ImGuiKey_F1 = 572
M.ImGuiKey_F2 = 573
M.ImGuiKey_F3 = 574
M.ImGuiKey_F4 = 575
M.ImGuiKey_F5 = 576
M.ImGuiKey_F6 = 577
M.ImGuiKey_F7 = 578
M.ImGuiKey_F8 = 579
M.ImGuiKey_F9 = 580
M.ImGuiKey_F10 = 581
M.ImGuiKey_F11 = 582
M.ImGuiKey_F12 = 583
M.ImGuiKey_F13 = 584
M.ImGuiKey_F14 = 585
M.ImGuiKey_F15 = 586
M.ImGuiKey_F16 = 587
M.ImGuiKey_F17 = 588
M.ImGuiKey_F18 = 589
M.ImGuiKey_F19 = 590
M.ImGuiKey_F20 = 591
M.ImGuiKey_F21 = 592
M.ImGuiKey_F22 = 593
M.ImGuiKey_F23 = 594
M.ImGuiKey_F24 = 595
M.ImGuiKey_Apostrophe = 596
M.ImGuiKey_Comma = 597
M.ImGuiKey_Minus = 598
M.ImGuiKey_Period = 599
M.ImGuiKey_Slash = 600
M.ImGuiKey_Semicolon = 601
M.ImGuiKey_Equal = 602
M.ImGuiKey_LeftBracket = 603
M.ImGuiKey_Backslash = 604
M.ImGuiKey_RightBracket = 605
M.ImGuiKey_GraveAccent = 606
M.ImGuiKey_CapsLock = 607
M.ImGuiKey_ScrollLock = 608
M.ImGuiKey_NumLock = 609
M.ImGuiKey_PrintScreen = 610
M.ImGuiKey_Pause = 611
M.ImGuiKey_Keypad0 = 612
M.ImGuiKey_Keypad1 = 613
M.ImGuiKey_Keypad2 = 614
M.ImGuiKey_Keypad3 = 615
M.ImGuiKey_Keypad4 = 616
M.ImGuiKey_Keypad5 = 617
M.ImGuiKey_Keypad6 = 618
M.ImGuiKey_Keypad7 = 619
M.ImGuiKey_Keypad8 = 620
M.ImGuiKey_Keypad9 = 621
M.ImGuiKey_KeypadDecimal = 622
M.ImGuiKey_KeypadDivide = 623
M.ImGuiKey_KeypadMultiply = 624
M.ImGuiKey_KeypadSubtract = 625
M.ImGuiKey_KeypadAdd = 626
M.ImGuiKey_KeypadEnter = 627
M.ImGuiKey_KeypadEqual = 628
M.ImGuiKey_AppBack = 629
M.ImGuiKey_AppForward = 630
M.ImGuiKey_GamepadStart = 631
M.ImGuiKey_GamepadBack = 632
M.ImGuiKey_GamepadFaceLeft = 633
M.ImGuiKey_GamepadFaceRight = 634
M.ImGuiKey_GamepadFaceUp = 635
M.ImGuiKey_GamepadFaceDown = 636
M.ImGuiKey_GamepadDpadLeft = 637
M.ImGuiKey_GamepadDpadRight = 638
M.ImGuiKey_GamepadDpadUp = 639
M.ImGuiKey_GamepadDpadDown = 640
M.ImGuiKey_GamepadL1 = 641
M.ImGuiKey_GamepadR1 = 642
M.ImGuiKey_GamepadL2 = 643
M.ImGuiKey_GamepadR2 = 644
M.ImGuiKey_GamepadL3 = 645
M.ImGuiKey_GamepadR3 = 646
M.ImGuiKey_GamepadLStickLeft = 647
M.ImGuiKey_GamepadLStickRight = 648
M.ImGuiKey_GamepadLStickUp = 649
M.ImGuiKey_GamepadLStickDown = 650
M.ImGuiKey_GamepadRStickLeft = 651
M.ImGuiKey_GamepadRStickRight = 652
M.ImGuiKey_GamepadRStickUp = 653
M.ImGuiKey_GamepadRStickDown = 654
M.ImGuiKey_MouseLeft = 655
M.ImGuiKey_MouseRight = 656
M.ImGuiKey_MouseMiddle = 657
M.ImGuiKey_MouseX1 = 658
M.ImGuiKey_MouseX2 = 659
M.ImGuiKey_MouseWheelX = 660
M.ImGuiKey_MouseWheelY = 661
M.ImGuiKey_ReservedForModCtrl = 662
M.ImGuiKey_ReservedForModShift = 663
M.ImGuiKey_ReservedForModAlt = 664
M.ImGuiKey_ReservedForModSuper = 665
M.ImGuiKey_COUNT = 666
M.ImGuiMod_None = 0
M.ImGuiMod_Ctrl = 4096
M.ImGuiMod_Shift = 8192
M.ImGuiMod_Alt = 16384
M.ImGuiMod_Super = 32768
M.ImGuiMod_Mask_ = 61440
M.ImGuiKey_NamedKey_BEGIN = 512
M.ImGuiKey_NamedKey_END = 666
M.ImGuiKey_NamedKey_COUNT = 154
M.ImGuiKey_KeysData_SIZE = 154
M.ImGuiKey_KeysData_OFFSET = 512
M.ImGuiMouseButton_Left = 0
M.ImGuiMouseButton_Right = 1
M.ImGuiMouseButton_Middle = 2
M.ImGuiMouseButton_COUNT = 5
M.ImGuiMouseCursor_None = -1
M.ImGuiMouseCursor_Arrow = 0
M.ImGuiMouseCursor_TextInput = 1
M.ImGuiMouseCursor_ResizeAll = 2
M.ImGuiMouseCursor_ResizeNS = 3
M.ImGuiMouseCursor_ResizeEW = 4
M.ImGuiMouseCursor_ResizeNESW = 5
M.ImGuiMouseCursor_ResizeNWSE = 6
M.ImGuiMouseCursor_Hand = 7
M.ImGuiMouseCursor_NotAllowed = 8
M.ImGuiMouseCursor_COUNT = 9
M.ImGuiMouseSource_Mouse = 0
M.ImGuiMouseSource_TouchScreen = 1
M.ImGuiMouseSource_Pen = 2
M.ImGuiMouseSource_COUNT = 3
M.ImGuiMultiSelectFlags_None = 0
M.ImGuiMultiSelectFlags_SingleSelect = 1
M.ImGuiMultiSelectFlags_NoSelectAll = 2
M.ImGuiMultiSelectFlags_NoRangeSelect = 4
M.ImGuiMultiSelectFlags_NoAutoSelect = 8
M.ImGuiMultiSelectFlags_NoAutoClear = 16
M.ImGuiMultiSelectFlags_NoAutoClearOnReselect = 32
M.ImGuiMultiSelectFlags_BoxSelect1d = 64
M.ImGuiMultiSelectFlags_BoxSelect2d = 128
M.ImGuiMultiSelectFlags_BoxSelectNoScroll = 256
M.ImGuiMultiSelectFlags_ClearOnEscape = 512
M.ImGuiMultiSelectFlags_ClearOnClickVoid = 1024
M.ImGuiMultiSelectFlags_ScopeWindow = 2048
M.ImGuiMultiSelectFlags_ScopeRect = 4096
M.ImGuiMultiSelectFlags_SelectOnClick = 8192
M.ImGuiMultiSelectFlags_SelectOnClickRelease = 16384
M.ImGuiMultiSelectFlags_NavWrapX = 65536
M.ImGuiPopupFlags_None = 0
M.ImGuiPopupFlags_MouseButtonLeft = 0
M.ImGuiPopupFlags_MouseButtonRight = 1
M.ImGuiPopupFlags_MouseButtonMiddle = 2
M.ImGuiPopupFlags_MouseButtonMask_ = 31
M.ImGuiPopupFlags_MouseButtonDefault_ = 1
M.ImGuiPopupFlags_NoReopen = 32
M.ImGuiPopupFlags_NoOpenOverExistingPopup = 128
M.ImGuiPopupFlags_NoOpenOverItems = 256
M.ImGuiPopupFlags_AnyPopupId = 1024
M.ImGuiPopupFlags_AnyPopupLevel = 2048
M.ImGuiPopupFlags_AnyPopup = 3072
M.ImGuiSelectableFlags_None = 0
M.ImGuiSelectableFlags_NoAutoClosePopups = 1
M.ImGuiSelectableFlags_SpanAllColumns = 2
M.ImGuiSelectableFlags_AllowDoubleClick = 4
M.ImGuiSelectableFlags_Disabled = 8
M.ImGuiSelectableFlags_AllowOverlap = 16
M.ImGuiSelectableFlags_Highlight = 32
M.ImGuiSelectionRequestType_None = 0
M.ImGuiSelectionRequestType_SetAll = 1
M.ImGuiSelectionRequestType_SetRange = 2
M.ImGuiSliderFlags_None = 0
M.ImGuiSliderFlags_AlwaysClamp = 16
M.ImGuiSliderFlags_Logarithmic = 32
M.ImGuiSliderFlags_NoRoundToFormat = 64
M.ImGuiSliderFlags_NoInput = 128
M.ImGuiSliderFlags_WrapAround = 256
M.ImGuiSliderFlags_InvalidMask_ = 1879048207
M.ImGuiSortDirection_None = 0
M.ImGuiSortDirection_Ascending = 1
M.ImGuiSortDirection_Descending = 2
M.ImGuiStyleVar_Alpha = 0
M.ImGuiStyleVar_DisabledAlpha = 1
M.ImGuiStyleVar_WindowPadding = 2
M.ImGuiStyleVar_WindowRounding = 3
M.ImGuiStyleVar_WindowBorderSize = 4
M.ImGuiStyleVar_WindowMinSize = 5
M.ImGuiStyleVar_WindowTitleAlign = 6
M.ImGuiStyleVar_ChildRounding = 7
M.ImGuiStyleVar_ChildBorderSize = 8
M.ImGuiStyleVar_PopupRounding = 9
M.ImGuiStyleVar_PopupBorderSize = 10
M.ImGuiStyleVar_FramePadding = 11
M.ImGuiStyleVar_FrameRounding = 12
M.ImGuiStyleVar_FrameBorderSize = 13
M.ImGuiStyleVar_ItemSpacing = 14
M.ImGuiStyleVar_ItemInnerSpacing = 15
M.ImGuiStyleVar_IndentSpacing = 16
M.ImGuiStyleVar_CellPadding = 17
M.ImGuiStyleVar_ScrollbarSize = 18
M.ImGuiStyleVar_ScrollbarRounding = 19
M.ImGuiStyleVar_GrabMinSize = 20
M.ImGuiStyleVar_GrabRounding = 21
M.ImGuiStyleVar_TabRounding = 22
M.ImGuiStyleVar_TabBorderSize = 23
M.ImGuiStyleVar_TabBarBorderSize = 24
M.ImGuiStyleVar_TabBarOverlineSize = 25
M.ImGuiStyleVar_TableAngledHeadersAngle = 26
M.ImGuiStyleVar_TableAngledHeadersTextAlign = 27
M.ImGuiStyleVar_ButtonTextAlign = 28
M.ImGuiStyleVar_SelectableTextAlign = 29
M.ImGuiStyleVar_SeparatorTextBorderSize = 30
M.ImGuiStyleVar_SeparatorTextAlign = 31
M.ImGuiStyleVar_SeparatorTextPadding = 32
M.ImGuiStyleVar_DockingSeparatorSize = 33
M.ImGuiStyleVar_COUNT = 34
M.ImGuiTabBarFlags_None = 0
M.ImGuiTabBarFlags_Reorderable = 1
M.ImGuiTabBarFlags_AutoSelectNewTabs = 2
M.ImGuiTabBarFlags_TabListPopupButton = 4
M.ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 8
M.ImGuiTabBarFlags_NoTabListScrollingButtons = 16
M.ImGuiTabBarFlags_NoTooltip = 32
M.ImGuiTabBarFlags_DrawSelectedOverline = 64
M.ImGuiTabBarFlags_FittingPolicyResizeDown = 128
M.ImGuiTabBarFlags_FittingPolicyScroll = 256
M.ImGuiTabBarFlags_FittingPolicyMask_ = 384
M.ImGuiTabBarFlags_FittingPolicyDefault_ = 128
M.ImGuiTabItemFlags_None = 0
M.ImGuiTabItemFlags_UnsavedDocument = 1
M.ImGuiTabItemFlags_SetSelected = 2
M.ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 4
M.ImGuiTabItemFlags_NoPushId = 8
M.ImGuiTabItemFlags_NoTooltip = 16
M.ImGuiTabItemFlags_NoReorder = 32
M.ImGuiTabItemFlags_Leading = 64
M.ImGuiTabItemFlags_Trailing = 128
M.ImGuiTabItemFlags_NoAssumedClosure = 256
M.ImGuiTableBgTarget_None = 0
M.ImGuiTableBgTarget_RowBg0 = 1
M.ImGuiTableBgTarget_RowBg1 = 2
M.ImGuiTableBgTarget_CellBg = 3
M.ImGuiTableColumnFlags_None = 0
M.ImGuiTableColumnFlags_Disabled = 1
M.ImGuiTableColumnFlags_DefaultHide = 2
M.ImGuiTableColumnFlags_DefaultSort = 4
M.ImGuiTableColumnFlags_WidthStretch = 8
M.ImGuiTableColumnFlags_WidthFixed = 16
M.ImGuiTableColumnFlags_NoResize = 32
M.ImGuiTableColumnFlags_NoReorder = 64
M.ImGuiTableColumnFlags_NoHide = 128
M.ImGuiTableColumnFlags_NoClip = 256
M.ImGuiTableColumnFlags_NoSort = 512
M.ImGuiTableColumnFlags_NoSortAscending = 1024
M.ImGuiTableColumnFlags_NoSortDescending = 2048
M.ImGuiTableColumnFlags_NoHeaderLabel = 4096
M.ImGuiTableColumnFlags_NoHeaderWidth = 8192
M.ImGuiTableColumnFlags_PreferSortAscending = 16384
M.ImGuiTableColumnFlags_PreferSortDescending = 32768
M.ImGuiTableColumnFlags_IndentEnable = 65536
M.ImGuiTableColumnFlags_IndentDisable = 131072
M.ImGuiTableColumnFlags_AngledHeader = 262144
M.ImGuiTableColumnFlags_IsEnabled = 16777216
M.ImGuiTableColumnFlags_IsVisible = 33554432
M.ImGuiTableColumnFlags_IsSorted = 67108864
M.ImGuiTableColumnFlags_IsHovered = 134217728
M.ImGuiTableColumnFlags_WidthMask_ = 24
M.ImGuiTableColumnFlags_IndentMask_ = 196608
M.ImGuiTableColumnFlags_StatusMask_ = 251658240
M.ImGuiTableColumnFlags_NoDirectResize_ = 1073741824
M.ImGuiTableFlags_None = 0
M.ImGuiTableFlags_Resizable = 1
M.ImGuiTableFlags_Reorderable = 2
M.ImGuiTableFlags_Hideable = 4
M.ImGuiTableFlags_Sortable = 8
M.ImGuiTableFlags_NoSavedSettings = 16
M.ImGuiTableFlags_ContextMenuInBody = 32
M.ImGuiTableFlags_RowBg = 64
M.ImGuiTableFlags_BordersInnerH = 128
M.ImGuiTableFlags_BordersOuterH = 256
M.ImGuiTableFlags_BordersInnerV = 512
M.ImGuiTableFlags_BordersOuterV = 1024
M.ImGuiTableFlags_BordersH = 384
M.ImGuiTableFlags_BordersV = 1536
M.ImGuiTableFlags_BordersInner = 640
M.ImGuiTableFlags_BordersOuter = 1280
M.ImGuiTableFlags_Borders = 1920
M.ImGuiTableFlags_NoBordersInBody = 2048
M.ImGuiTableFlags_NoBordersInBodyUntilResize = 4096
M.ImGuiTableFlags_SizingFixedFit = 8192
M.ImGuiTableFlags_SizingFixedSame = 16384
M.ImGuiTableFlags_SizingStretchProp = 24576
M.ImGuiTableFlags_SizingStretchSame = 32768
M.ImGuiTableFlags_NoHostExtendX = 65536
M.ImGuiTableFlags_NoHostExtendY = 131072
M.ImGuiTableFlags_NoKeepColumnsVisible = 262144
M.ImGuiTableFlags_PreciseWidths = 524288
M.ImGuiTableFlags_NoClip = 1048576
M.ImGuiTableFlags_PadOuterX = 2097152
M.ImGuiTableFlags_NoPadOuterX = 4194304
M.ImGuiTableFlags_NoPadInnerX = 8388608
M.ImGuiTableFlags_ScrollX = 16777216
M.ImGuiTableFlags_ScrollY = 33554432
M.ImGuiTableFlags_SortMulti = 67108864
M.ImGuiTableFlags_SortTristate = 134217728
M.ImGuiTableFlags_HighlightHoveredColumn = 268435456
M.ImGuiTableFlags_SizingMask_ = 57344
M.ImGuiTableRowFlags_None = 0
M.ImGuiTableRowFlags_Headers = 1
M.ImGuiTreeNodeFlags_None = 0
M.ImGuiTreeNodeFlags_Selected = 1
M.ImGuiTreeNodeFlags_Framed = 2
M.ImGuiTreeNodeFlags_AllowOverlap = 4
M.ImGuiTreeNodeFlags_NoTreePushOnOpen = 8
M.ImGuiTreeNodeFlags_NoAutoOpenOnLog = 16
M.ImGuiTreeNodeFlags_DefaultOpen = 32
M.ImGuiTreeNodeFlags_OpenOnDoubleClick = 64
M.ImGuiTreeNodeFlags_OpenOnArrow = 128
M.ImGuiTreeNodeFlags_Leaf = 256
M.ImGuiTreeNodeFlags_Bullet = 512
M.ImGuiTreeNodeFlags_FramePadding = 1024
M.ImGuiTreeNodeFlags_SpanAvailWidth = 2048
M.ImGuiTreeNodeFlags_SpanFullWidth = 4096
M.ImGuiTreeNodeFlags_SpanTextWidth = 8192
M.ImGuiTreeNodeFlags_SpanAllColumns = 16384
M.ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 32768
M.ImGuiTreeNodeFlags_CollapsingHeader = 26
M.ImGuiViewportFlags_None = 0
M.ImGuiViewportFlags_IsPlatformWindow = 1
M.ImGuiViewportFlags_IsPlatformMonitor = 2
M.ImGuiViewportFlags_OwnedByApp = 4
M.ImGuiViewportFlags_NoDecoration = 8
M.ImGuiViewportFlags_NoTaskBarIcon = 16
M.ImGuiViewportFlags_NoFocusOnAppearing = 32
M.ImGuiViewportFlags_NoFocusOnClick = 64
M.ImGuiViewportFlags_NoInputs = 128
M.ImGuiViewportFlags_NoRendererClear = 256
M.ImGuiViewportFlags_NoAutoMerge = 512
M.ImGuiViewportFlags_TopMost = 1024
M.ImGuiViewportFlags_CanHostOtherWindows = 2048
M.ImGuiViewportFlags_IsMinimized = 4096
M.ImGuiViewportFlags_IsFocused = 8192
M.ImGuiWindowFlags_None = 0
M.ImGuiWindowFlags_NoTitleBar = 1
M.ImGuiWindowFlags_NoResize = 2
M.ImGuiWindowFlags_NoMove = 4
M.ImGuiWindowFlags_NoScrollbar = 8
M.ImGuiWindowFlags_NoScrollWithMouse = 16
M.ImGuiWindowFlags_NoCollapse = 32
M.ImGuiWindowFlags_AlwaysAutoResize = 64
M.ImGuiWindowFlags_NoBackground = 128
M.ImGuiWindowFlags_NoSavedSettings = 256
M.ImGuiWindowFlags_NoMouseInputs = 512
M.ImGuiWindowFlags_MenuBar = 1024
M.ImGuiWindowFlags_HorizontalScrollbar = 2048
M.ImGuiWindowFlags_NoFocusOnAppearing = 4096
M.ImGuiWindowFlags_NoBringToFrontOnFocus = 8192
M.ImGuiWindowFlags_AlwaysVerticalScrollbar = 16384
M.ImGuiWindowFlags_AlwaysHorizontalScrollbar = 32768
M.ImGuiWindowFlags_NoNavInputs = 65536
M.ImGuiWindowFlags_NoNavFocus = 131072
M.ImGuiWindowFlags_UnsavedDocument = 262144
M.ImGuiWindowFlags_NoDocking = 524288
M.ImGuiWindowFlags_NoNav = 196608
M.ImGuiWindowFlags_NoDecoration = 43
M.ImGuiWindowFlags_NoInputs = 197120
M.ImGuiWindowFlags_ChildWindow = 16777216
M.ImGuiWindowFlags_Tooltip = 33554432
M.ImGuiWindowFlags_Popup = 67108864
M.ImGuiWindowFlags_Modal = 134217728
M.ImGuiWindowFlags_ChildMenu = 268435456
M.ImGuiWindowFlags_DockNodeHost = 536870912