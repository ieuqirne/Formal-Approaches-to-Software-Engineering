pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-83)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#3ed19bc1#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#35869f17#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#357666d8#;
   pragma Export (C, u00005, "ada__calendar__delaysB");
   u00006 : constant Version_32 := 16#d86d2f1d#;
   pragma Export (C, u00006, "ada__calendar__delaysS");
   u00007 : constant Version_32 := 16#fc54e290#;
   pragma Export (C, u00007, "ada__calendarB");
   u00008 : constant Version_32 := 16#31350a81#;
   pragma Export (C, u00008, "ada__calendarS");
   u00009 : constant Version_32 := 16#90189159#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#2ccb9557#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#32a08138#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#77a38a8e#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#87be2c0f#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#77347921#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00018, "system__parametersB");
   u00019 : constant Version_32 := 16#7a4cd513#;
   pragma Export (C, u00019, "system__parametersS");
   u00020 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#1f63cb3c#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00022, "system__soft_links__initializeB");
   u00023 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00023, "system__soft_links__initializeS");
   u00024 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00024, "system__stack_checkingB");
   u00025 : constant Version_32 := 16#bc1fead0#;
   pragma Export (C, u00025, "system__stack_checkingS");
   u00026 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00026, "system__exception_tableB");
   u00027 : constant Version_32 := 16#6f0ee87a#;
   pragma Export (C, u00027, "system__exception_tableS");
   u00028 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#5ac3ecce#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00030, "system__exceptions__machineB");
   u00031 : constant Version_32 := 16#d27d9682#;
   pragma Export (C, u00031, "system__exceptions__machineS");
   u00032 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00032, "system__exceptions_debugB");
   u00033 : constant Version_32 := 16#4c2a78fc#;
   pragma Export (C, u00033, "system__exceptions_debugS");
   u00034 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00034, "system__img_intB");
   u00035 : constant Version_32 := 16#307b61fa#;
   pragma Export (C, u00035, "system__img_intS");
   u00036 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00036, "system__tracebackB");
   u00037 : constant Version_32 := 16#6c825ffc#;
   pragma Export (C, u00037, "system__tracebackS");
   u00038 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00038, "system__traceback_entriesB");
   u00039 : constant Version_32 := 16#32fb7748#;
   pragma Export (C, u00039, "system__traceback_entriesS");
   u00040 : constant Version_32 := 16#9ad5ad12#;
   pragma Export (C, u00040, "system__traceback__symbolicB");
   u00041 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00041, "system__traceback__symbolicS");
   u00042 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00042, "ada__containersS");
   u00043 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00043, "ada__exceptions__tracebackB");
   u00044 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00044, "ada__exceptions__tracebackS");
   u00045 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00045, "system__bounded_stringsB");
   u00046 : constant Version_32 := 16#455da021#;
   pragma Export (C, u00046, "system__bounded_stringsS");
   u00047 : constant Version_32 := 16#74f70e62#;
   pragma Export (C, u00047, "system__crtlS");
   u00048 : constant Version_32 := 16#cf32f6f7#;
   pragma Export (C, u00048, "system__dwarf_linesB");
   u00049 : constant Version_32 := 16#eeedbcbd#;
   pragma Export (C, u00049, "system__dwarf_linesS");
   u00050 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00050, "ada__charactersS");
   u00051 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00051, "ada__characters__handlingB");
   u00052 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00052, "ada__characters__handlingS");
   u00053 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00053, "ada__characters__latin_1S");
   u00054 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00054, "ada__stringsS");
   u00055 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00055, "ada__strings__mapsB");
   u00056 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00056, "ada__strings__mapsS");
   u00057 : constant Version_32 := 16#a21ad5cd#;
   pragma Export (C, u00057, "system__bit_opsB");
   u00058 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00058, "system__bit_opsS");
   u00059 : constant Version_32 := 16#0626fdbb#;
   pragma Export (C, u00059, "system__unsigned_typesS");
   u00060 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00060, "ada__strings__maps__constantsS");
   u00061 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00061, "interfacesS");
   u00062 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00062, "system__address_imageB");
   u00063 : constant Version_32 := 16#934c1c02#;
   pragma Export (C, u00063, "system__address_imageS");
   u00064 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00064, "system__img_unsB");
   u00065 : constant Version_32 := 16#99d2c14c#;
   pragma Export (C, u00065, "system__img_unsS");
   u00066 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00066, "system__ioB");
   u00067 : constant Version_32 := 16#ace27677#;
   pragma Export (C, u00067, "system__ioS");
   u00068 : constant Version_32 := 16#3080f2ca#;
   pragma Export (C, u00068, "system__mmapB");
   u00069 : constant Version_32 := 16#08d13e5f#;
   pragma Export (C, u00069, "system__mmapS");
   u00070 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00070, "ada__io_exceptionsS");
   u00071 : constant Version_32 := 16#a82e20f9#;
   pragma Export (C, u00071, "system__mmap__os_interfaceB");
   u00072 : constant Version_32 := 16#8f4541b8#;
   pragma Export (C, u00072, "system__mmap__os_interfaceS");
   u00073 : constant Version_32 := 16#de8ca4eb#;
   pragma Export (C, u00073, "system__os_libB");
   u00074 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00074, "system__os_libS");
   u00075 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00075, "system__case_utilB");
   u00076 : constant Version_32 := 16#0d75376c#;
   pragma Export (C, u00076, "system__case_utilS");
   u00077 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00077, "system__stringsB");
   u00078 : constant Version_32 := 16#52b6adad#;
   pragma Export (C, u00078, "system__stringsS");
   u00079 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00079, "interfaces__cB");
   u00080 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00080, "interfaces__cS");
   u00081 : constant Version_32 := 16#5a3f5337#;
   pragma Export (C, u00081, "system__object_readerB");
   u00082 : constant Version_32 := 16#f6d45c39#;
   pragma Export (C, u00082, "system__object_readerS");
   u00083 : constant Version_32 := 16#fb020d94#;
   pragma Export (C, u00083, "system__val_lliB");
   u00084 : constant Version_32 := 16#5ece13c8#;
   pragma Export (C, u00084, "system__val_lliS");
   u00085 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00085, "system__val_lluB");
   u00086 : constant Version_32 := 16#6be87059#;
   pragma Export (C, u00086, "system__val_lluS");
   u00087 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00087, "system__val_utilB");
   u00088 : constant Version_32 := 16#9e0037c6#;
   pragma Export (C, u00088, "system__val_utilS");
   u00089 : constant Version_32 := 16#d7bf3f29#;
   pragma Export (C, u00089, "system__exception_tracesB");
   u00090 : constant Version_32 := 16#167fa1a2#;
   pragma Export (C, u00090, "system__exception_tracesS");
   u00091 : constant Version_32 := 16#f66d6445#;
   pragma Export (C, u00091, "system__win32S");
   u00092 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00092, "system__wch_conB");
   u00093 : constant Version_32 := 16#29dda3ea#;
   pragma Export (C, u00093, "system__wch_conS");
   u00094 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00094, "system__wch_stwB");
   u00095 : constant Version_32 := 16#04cc8feb#;
   pragma Export (C, u00095, "system__wch_stwS");
   u00096 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00096, "system__wch_cnvB");
   u00097 : constant Version_32 := 16#266a1919#;
   pragma Export (C, u00097, "system__wch_cnvS");
   u00098 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00098, "system__wch_jisB");
   u00099 : constant Version_32 := 16#a61a0038#;
   pragma Export (C, u00099, "system__wch_jisS");
   u00100 : constant Version_32 := 16#24ec69e6#;
   pragma Export (C, u00100, "system__os_primitivesB");
   u00101 : constant Version_32 := 16#355de4ce#;
   pragma Export (C, u00101, "system__os_primitivesS");
   u00102 : constant Version_32 := 16#05c60a38#;
   pragma Export (C, u00102, "system__task_lockB");
   u00103 : constant Version_32 := 16#532ab656#;
   pragma Export (C, u00103, "system__task_lockS");
   u00104 : constant Version_32 := 16#3d84d1b9#;
   pragma Export (C, u00104, "system__win32__extS");
   u00105 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00105, "ada__integer_text_ioB");
   u00106 : constant Version_32 := 16#2ec7c168#;
   pragma Export (C, u00106, "ada__integer_text_ioS");
   u00107 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00107, "ada__text_ioB");
   u00108 : constant Version_32 := 16#03e83e15#;
   pragma Export (C, u00108, "ada__text_ioS");
   u00109 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00109, "ada__streamsB");
   u00110 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00110, "ada__streamsS");
   u00111 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00111, "ada__tagsB");
   u00112 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00112, "ada__tagsS");
   u00113 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00113, "system__htableB");
   u00114 : constant Version_32 := 16#b66232d2#;
   pragma Export (C, u00114, "system__htableS");
   u00115 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00115, "system__string_hashB");
   u00116 : constant Version_32 := 16#143c59ac#;
   pragma Export (C, u00116, "system__string_hashS");
   u00117 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00117, "interfaces__c_streamsB");
   u00118 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00118, "interfaces__c_streamsS");
   u00119 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00119, "system__file_ioB");
   u00120 : constant Version_32 := 16#95d1605d#;
   pragma Export (C, u00120, "system__file_ioS");
   u00121 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00121, "ada__finalizationS");
   u00122 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00122, "system__finalization_rootB");
   u00123 : constant Version_32 := 16#7d52f2a8#;
   pragma Export (C, u00123, "system__finalization_rootS");
   u00124 : constant Version_32 := 16#cf3f1b90#;
   pragma Export (C, u00124, "system__file_control_blockS");
   u00125 : constant Version_32 := 16#fdedfd10#;
   pragma Export (C, u00125, "ada__text_io__integer_auxB");
   u00126 : constant Version_32 := 16#2fe01d89#;
   pragma Export (C, u00126, "ada__text_io__integer_auxS");
   u00127 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00127, "ada__text_io__generic_auxB");
   u00128 : constant Version_32 := 16#305a076a#;
   pragma Export (C, u00128, "ada__text_io__generic_auxS");
   u00129 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00129, "system__img_biuB");
   u00130 : constant Version_32 := 16#c00475f6#;
   pragma Export (C, u00130, "system__img_biuS");
   u00131 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00131, "system__img_llbB");
   u00132 : constant Version_32 := 16#81c36508#;
   pragma Export (C, u00132, "system__img_llbS");
   u00133 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00133, "system__img_lliB");
   u00134 : constant Version_32 := 16#23efd4e9#;
   pragma Export (C, u00134, "system__img_lliS");
   u00135 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00135, "system__img_llwB");
   u00136 : constant Version_32 := 16#28af469e#;
   pragma Export (C, u00136, "system__img_llwS");
   u00137 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00137, "system__img_wiuB");
   u00138 : constant Version_32 := 16#ae45f264#;
   pragma Export (C, u00138, "system__img_wiuS");
   u00139 : constant Version_32 := 16#0f9783a4#;
   pragma Export (C, u00139, "system__val_intB");
   u00140 : constant Version_32 := 16#875fe85b#;
   pragma Export (C, u00140, "system__val_intS");
   u00141 : constant Version_32 := 16#383fd226#;
   pragma Export (C, u00141, "system__val_unsB");
   u00142 : constant Version_32 := 16#33208002#;
   pragma Export (C, u00142, "system__val_unsS");
   u00143 : constant Version_32 := 16#bc86aad0#;
   pragma Export (C, u00143, "reactorB");
   u00144 : constant Version_32 := 16#33a0da64#;
   pragma Export (C, u00144, "reactorS");
   u00145 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00145, "system__concat_2B");
   u00146 : constant Version_32 := 16#300056e8#;
   pragma Export (C, u00146, "system__concat_2S");
   u00147 : constant Version_32 := 16#273384e4#;
   pragma Export (C, u00147, "system__img_enum_newB");
   u00148 : constant Version_32 := 16#53ec87f8#;
   pragma Export (C, u00148, "system__img_enum_newS");
   u00149 : constant Version_32 := 16#5b883cde#;
   pragma Export (C, u00149, "trainB");
   u00150 : constant Version_32 := 16#fc3e1d20#;
   pragma Export (C, u00150, "trainS");
   u00151 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00151, "ada__float_text_ioB");
   u00152 : constant Version_32 := 16#39060f6c#;
   pragma Export (C, u00152, "ada__float_text_ioS");
   u00153 : constant Version_32 := 16#25afee5b#;
   pragma Export (C, u00153, "ada__text_io__float_auxB");
   u00154 : constant Version_32 := 16#6ecdea4c#;
   pragma Export (C, u00154, "ada__text_io__float_auxS");
   u00155 : constant Version_32 := 16#8aa4f090#;
   pragma Export (C, u00155, "system__img_realB");
   u00156 : constant Version_32 := 16#f508d0da#;
   pragma Export (C, u00156, "system__img_realS");
   u00157 : constant Version_32 := 16#36373acb#;
   pragma Export (C, u00157, "system__fat_llfS");
   u00158 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00158, "system__float_controlB");
   u00159 : constant Version_32 := 16#d25cc204#;
   pragma Export (C, u00159, "system__float_controlS");
   u00160 : constant Version_32 := 16#3e932977#;
   pragma Export (C, u00160, "system__img_lluB");
   u00161 : constant Version_32 := 16#4feffd78#;
   pragma Export (C, u00161, "system__img_lluS");
   u00162 : constant Version_32 := 16#62d0e74f#;
   pragma Export (C, u00162, "system__powten_tableS");
   u00163 : constant Version_32 := 16#c5134340#;
   pragma Export (C, u00163, "system__val_realB");
   u00164 : constant Version_32 := 16#3cdf6ded#;
   pragma Export (C, u00164, "system__val_realS");
   u00165 : constant Version_32 := 16#b2a569d2#;
   pragma Export (C, u00165, "system__exn_llfB");
   u00166 : constant Version_32 := 16#8ede3ae4#;
   pragma Export (C, u00166, "system__exn_llfS");
   u00167 : constant Version_32 := 16#6ad59d2c#;
   pragma Export (C, u00167, "system__fat_fltS");
   u00168 : constant Version_32 := 16#d250054c#;
   pragma Export (C, u00168, "watertankB");
   u00169 : constant Version_32 := 16#61b4fcf9#;
   pragma Export (C, u00169, "watertankS");
   u00170 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00170, "system__memoryB");
   u00171 : constant Version_32 := 16#6bdde70c#;
   pragma Export (C, u00171, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.win32%s
   --  ada.characters.handling%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.val_lli%b
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.img_real%s
   --  system.img_real%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  system.val_real%s
   --  system.val_real%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  system.win32.ext%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%s
   --  ada.text_io.float_aux%b
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  reactor%s
   --  reactor%b
   --  watertank%s
   --  watertank%b
   --  train%s
   --  train%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
