import 'package:flutter_training/network/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static Future<void> init() async {
    await Supabase.initialize(
      url: ApiConstant.supabaseUrl,
      anonKey: ApiConstant.supabaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
