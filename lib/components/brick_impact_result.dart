import 'brick.dart';

class BrickImpactResult {
  final BrickDamage newDamageState;
  final int? pointsAwarded;
  final bool isDestroyed;

  BrickImpactResult(this.newDamageState, this.pointsAwarded, this.isDestroyed);
}

BrickImpactResult calculateImpactResult(
  double impactVelocity,
  Brick brick,
) {
  BrickType material = brick.type;
  BrickDamage currentDamageState = brick.damage;
  BrickSize size = brick.size;

  // Define damage thresholds for each material
  final Map<BrickType, List<double>> damageThresholds = {
    BrickType.explosive: [25, 50],
    BrickType.glass: [25, 50],
    BrickType.metal: [40, 80],
    BrickType.stone: [50, 100],
    BrickType.wood: [30, 60],
  };

  final Map<BrickSize, double> sizeThreshold = {
    BrickSize.size70x70: 0.2,
    BrickSize.size140x70: 0.4,
    BrickSize.size70x140: 0.4,
    BrickSize.size220x70: 0.6,
    BrickSize.size70x220: 0.6,
    BrickSize.size140x140: 0.8,
    BrickSize.size220x140: 1.0,
    BrickSize.size140x220: 1.0,
  };

  // Get the thresholds for the current material
  final thresholds = damageThresholds[material]!;
  final brickSize = sizeThreshold[size]!;

  final lowThreshold = thresholds[0] * brickSize;
  final highThreshold = thresholds[1] * brickSize;
  bool isDestroyed = false;

  // Calculate damage
  BrickDamage newDamageState = currentDamageState;

  if (currentDamageState == BrickDamage.lots) {
    isDestroyed = true;
  } else if (currentDamageState == BrickDamage.some) {
    if (impactVelocity >= highThreshold) {
      isDestroyed = true;
    } else {
      newDamageState = BrickDamage.lots;
    }
  } else {
    if (impactVelocity >= highThreshold) {
      isDestroyed = true;
    } else if (impactVelocity >= lowThreshold) {
      newDamageState = BrickDamage.lots;
    } else {
      newDamageState = BrickDamage.some;
    }
  }

  // Calculate points

  double? pointsAwarded;

  if (isDestroyed) {
    pointsAwarded = highThreshold.toInt() * 250;
  }

  return BrickImpactResult(newDamageState, pointsAwarded?.toInt(), isDestroyed);
}
