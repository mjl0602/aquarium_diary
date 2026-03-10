// lib/models/enums.dart

/// 鱼缸结构
enum AquariumStructure {
  bottomFilter,   // 底滤
  backFilter,     // 背滤
  topFilter,      // 上滤
  hangOn,         // 外挂缸
  diy,            // DIY
  bare;           // 裸缸

  String get label {
    switch (this) {
      case AquariumStructure.bottomFilter: return '底滤';
      case AquariumStructure.backFilter: return '背滤';
      case AquariumStructure.topFilter: return '上滤';
      case AquariumStructure.hangOn: return '外挂缸';
      case AquariumStructure.diy: return 'DIY';
      case AquariumStructure.bare: return '裸缸';
    }
  }
}

/// 耗材类型
enum ConsumableType {
  fishFood,       // 鱼粮
  filterCotton,   // 滤棉
  reagent,        // 试剂
  seaSalt,        // 海盐
  other;          // 其他

  String get label {
    switch (this) {
      case ConsumableType.fishFood: return '鱼粮';
      case ConsumableType.filterCotton: return '滤棉';
      case ConsumableType.reagent: return '试剂';
      case ConsumableType.seaSalt: return '海盐';
      case ConsumableType.other: return '其他';
    }
  }
}

/// 设备状态
enum EquipmentStatus {
  planned,        // 计划购买
  active,         // 正常使用
  sold,           // 已出二手
  discarded;      // 已废弃

  String get label {
    switch (this) {
      case EquipmentStatus.planned: return '计划购买';
      case EquipmentStatus.active: return '正常使用';
      case EquipmentStatus.sold: return '已出二手';
      case EquipmentStatus.discarded: return '已废弃';
    }
  }
}

/// 生物分类
enum CreatureCategory {
  fish,           // 鱼
  coral,          // 珊瑚
  shrimp,         // 虾蟹
  algae,          // 水藻
  snail,          // 螺
  clam,           // 贝类
  anemone,        // 海葵
  starfish,       // 海星
  urchin,         // 海胆
  seaCucumber,    // 海参
  nudibranch,     // 海兔
  tubeWorm,       // 管虫
  other;          // 其他

  String get label {
    switch (this) {
      case CreatureCategory.fish: return '鱼';
      case CreatureCategory.coral: return '珊瑚';
      case CreatureCategory.shrimp: return '虾蟹';
      case CreatureCategory.algae: return '水藻';
      case CreatureCategory.snail: return '螺';
      case CreatureCategory.clam: return '贝类';
      case CreatureCategory.anemone: return '海葵';
      case CreatureCategory.starfish: return '海星';
      case CreatureCategory.urchin: return '海胆';
      case CreatureCategory.seaCucumber: return '海参';
      case CreatureCategory.nudibranch: return '海兔';
      case CreatureCategory.tubeWorm: return '管虫';
      case CreatureCategory.other: return '其他';
    }
  }
}

/// 生物状态
enum CreatureStatus {
  ordered,        // 下单
  alive,          // 正常存活
  weak,           // 状态差
  dead,           // 死亡
  missing,        // 失踪
  sold,           // 出售
  gifted;         // 赠送

  String get label {
    switch (this) {
      case CreatureStatus.ordered: return '下单';
      case CreatureStatus.alive: return '正常存活';
      case CreatureStatus.weak: return '状态差';
      case CreatureStatus.dead: return '死亡';
      case CreatureStatus.missing: return '失踪';
      case CreatureStatus.sold: return '出售';
      case CreatureStatus.gifted: return '赠送';
    }
  }
}

/// 攻击性
enum Aggressiveness {
  peaceful,       // 温和
  moderate,       // 中等
  aggressive,     // 凶猛
  veryAggressive; // 极凶

  String get label {
    switch (this) {
      case Aggressiveness.peaceful: return '温和';
      case Aggressiveness.moderate: return '中等';
      case Aggressiveness.aggressive: return '凶猛';
      case Aggressiveness.veryAggressive: return '极凶';
    }
  }
}

/// 珊瑚兼容性
enum CoralCompatibility {
  safe,           // 安全
  caution,        // 谨慎
  dangerous;      // 危险

  String get label {
    switch (this) {
      case CoralCompatibility.safe: return '安全';
      case CoralCompatibility.caution: return '谨慎';
      case CoralCompatibility.dangerous: return '危险';
    }
  }
}

/// 维护操作类型
enum MaintenanceOperation {
  setup,              // 开缸
  algaeBloom,         // 暴藻
  feeding,            // 喂食
  algaeClean,         // 刮藻
  waterChange,        // 换水
  cottonChange,       // 换棉
  equipmentChange,    // 更换设备
  waterTest,          // 测试水质
  consumableChange;   // 更换耗材

  String get label {
    switch (this) {
      case MaintenanceOperation.setup: return '开缸';
      case MaintenanceOperation.algaeBloom: return '暴藻';
      case MaintenanceOperation.feeding: return '喂食';
      case MaintenanceOperation.algaeClean: return '刮藻';
      case MaintenanceOperation.waterChange: return '换水';
      case MaintenanceOperation.cottonChange: return '换棉';
      case MaintenanceOperation.equipmentChange: return '更换设备';
      case MaintenanceOperation.waterTest: return '测试水质';
      case MaintenanceOperation.consumableChange: return '更换耗材';
    }
  }
}

/// 周期类型
enum CycleType {
  daily,      // 每天
  weekly,     // 每周
  monthly,    // 每月
  yearly,     // 每年
  custom;     // 自定义

  String get label {
    switch (this) {
      case CycleType.daily: return '每天';
      case CycleType.weekly: return '每周';
      case CycleType.monthly: return '每月';
      case CycleType.yearly: return '每年';
      case CycleType.custom: return '自定义';
    }
  }
}

/// 计划操作类型
enum ScheduleOperation {
  waterChange,        // 换水
  waterTest,          // 测试水质
  feeding,            // 喂食
  algaeClean,         // 刮藻
  cottonChange,       // 换棉
  consumableChange,   // 更换耗材
  equipmentCheck,     // 设备检查
  other;              // 其他

  String get label {
    switch (this) {
      case ScheduleOperation.waterChange: return '换水';
      case ScheduleOperation.waterTest: return '测试水质';
      case ScheduleOperation.feeding: return '喂食';
      case ScheduleOperation.algaeClean: return '刮藻';
      case ScheduleOperation.cottonChange: return '换棉';
      case ScheduleOperation.consumableChange: return '更换耗材';
      case ScheduleOperation.equipmentCheck: return '设备检查';
      case ScheduleOperation.other: return '其他';
    }
  }
}


/// 图片关联类型
enum ImageRefType {
  aquarium,       // 鱼缸
  creature,       // 生物
  maintenance,    // 维护记录
  equipment,      // 设备
  consumable,     // 耗材
  other;          // 其他

  String get label {
    switch (this) {
      case ImageRefType.aquarium: return '鱼缸';
      case ImageRefType.creature: return '生物';
      case ImageRefType.maintenance: return '维护记录';
      case ImageRefType.equipment: return '设备';
      case ImageRefType.consumable: return '耗材';
      case ImageRefType.other: return '其他';
    }
  }
}