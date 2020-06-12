; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main-none-none-eabi -mattr=+mve -verify-machineinstrs %s -o - | FileCheck %s --check-prefix=CHECK --check-prefix=CHECK-LE
; RUN: llc -mtriple=thumbebv8.1m.main-none-none-eabi -mattr=+mve -verify-machineinstrs %s -o - | FileCheck %s --check-prefix=CHECK --check-prefix=CHECK-BE

define void @foo_int8_int32(<4 x i8>* %dest, <4 x i32>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int8_int32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r1]
; CHECK-NEXT:    vstrb.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i32>, <4 x i32>* %src, align 4
  %0 = trunc <4 x i32> %wide.load to <4 x i8>
  store <4 x i8> %0, <4 x i8>* %dest, align 1
  ret void
}

define void @foo_int16_int32(<4 x i16>* %dest, <4 x i32>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int16_int32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r1]
; CHECK-NEXT:    vstrh.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i32>, <4 x i32>* %src, align 4
  %0 = trunc <4 x i32> %wide.load to <4 x i16>
  store <4 x i16> %0, <4 x i16>* %dest, align 2
  ret void
}

define void @foo_int8_int16(<8 x i8>* %dest, <8 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int8_int16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u16 q0, [r1]
; CHECK-NEXT:    vstrb.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <8 x i16>, <8 x i16>* %src, align 2
  %0 = trunc <8 x i16> %wide.load to <8 x i8>
  store <8 x i8> %0, <8 x i8>* %dest, align 1
  ret void
}


define void @foo_int8_int32_double(<16 x i8>* %dest, <16 x i32>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int8_int32_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r1]
; CHECK-NEXT:    vldrw.u32 q1, [r1, #16]
; CHECK-NEXT:    vldrw.u32 q2, [r1, #32]
; CHECK-NEXT:    vldrw.u32 q3, [r1, #48]
; CHECK-NEXT:    vstrb.32 q1, [r0, #4]
; CHECK-NEXT:    vstrb.32 q0, [r0]
; CHECK-NEXT:    vstrb.32 q3, [r0, #12]
; CHECK-NEXT:    vstrb.32 q2, [r0, #8]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <16 x i32>, <16 x i32>* %src, align 4
  %0 = trunc <16 x i32> %wide.load to <16 x i8>
  store <16 x i8> %0, <16 x i8>* %dest, align 1
  ret void
}

define void @foo_int16_int32_double(<8 x i16>* %dest, <8 x i32>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int16_int32_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r1]
; CHECK-NEXT:    vldrw.u32 q1, [r1, #16]
; CHECK-NEXT:    vstrh.32 q1, [r0, #8]
; CHECK-NEXT:    vstrh.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <8 x i32>, <8 x i32>* %src, align 4
  %0 = trunc <8 x i32> %wide.load to <8 x i16>
  store <8 x i16> %0, <8 x i16>* %dest, align 2
  ret void
}

define void @foo_int8_int16_double(<16 x i8>* %dest, <16 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int8_int16_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u16 q0, [r1]
; CHECK-NEXT:    vldrh.u16 q1, [r1, #16]
; CHECK-NEXT:    vstrb.16 q1, [r0, #8]
; CHECK-NEXT:    vstrb.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <16 x i16>, <16 x i16>* %src, align 2
  %0 = trunc <16 x i16> %wide.load to <16 x i8>
  store <16 x i8> %0, <16 x i8>* %dest, align 1
  ret void
}


define void @foo_int32_int8(<4 x i32>* %dest, <4 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int32_int8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.s32 q0, [r1]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i8>, <4 x i8>* %src, align 1
  %0 = sext <4 x i8> %wide.load to <4 x i32>
  store <4 x i32> %0, <4 x i32>* %dest, align 4
  ret void
}

define void @foo_int16_int8(<8 x i16>* %dest, <8 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int16_int8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.s16 q0, [r1]
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <8 x i8>, <8 x i8>* %src, align 1
  %0 = sext <8 x i8> %wide.load to <8 x i16>
  store <8 x i16> %0, <8 x i16>* %dest, align 2
  ret void
}

define void @foo_int32_int16(<4 x i32>* %dest, <4 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int32_int16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.s32 q0, [r1]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i16>, <4 x i16>* %src, align 2
  %0 = sext <4 x i16> %wide.load to <4 x i32>
  store <4 x i32> %0, <4 x i32>* %dest, align 4
  ret void
}

define void @foo_int32_int8_double(<16 x i32>* %dest, <16 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int32_int8_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.s32 q0, [r1, #4]
; CHECK-NEXT:    vldrb.s32 q1, [r1]
; CHECK-NEXT:    vldrb.s32 q2, [r1, #12]
; CHECK-NEXT:    vldrb.s32 q3, [r1, #8]
; CHECK-NEXT:    vstrw.32 q1, [r0]
; CHECK-NEXT:    vstrw.32 q0, [r0, #16]
; CHECK-NEXT:    vstrw.32 q3, [r0, #32]
; CHECK-NEXT:    vstrw.32 q2, [r0, #48]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <16 x i8>, <16 x i8>* %src, align 1
  %0 = sext <16 x i8> %wide.load to <16 x i32>
  store <16 x i32> %0, <16 x i32>* %dest, align 4
  ret void
}

define void @foo_int16_int8_double(<16 x i16>* %dest, <16 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int16_int8_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.s16 q0, [r1]
; CHECK-NEXT:    vldrb.s16 q1, [r1, #8]
; CHECK-NEXT:    vstrh.16 q1, [r0, #16]
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <16 x i8>, <16 x i8>* %src, align 1
  %0 = sext <16 x i8> %wide.load to <16 x i16>
  store <16 x i16> %0, <16 x i16>* %dest, align 2
  ret void
}

define void @foo_int32_int16_double(<8 x i32>* %dest, <8 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int32_int16_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.s32 q0, [r1]
; CHECK-NEXT:    vldrh.s32 q1, [r1, #8]
; CHECK-NEXT:    vstrw.32 q1, [r0, #16]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <8 x i16>, <8 x i16>* %src, align 2
  %0 = sext <8 x i16> %wide.load to <8 x i32>
  store <8 x i32> %0, <8 x i32>* %dest, align 4
  ret void
}


define void @foo_uint32_uint8(<4 x i32>* %dest, <4 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint32_uint8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u32 q0, [r1]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i8>, <4 x i8>* %src, align 1
  %0 = zext <4 x i8> %wide.load to <4 x i32>
  store <4 x i32> %0, <4 x i32>* %dest, align 4
  ret void
}

define void @foo_uint16_uint8(<8 x i16>* %dest, <8 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint16_uint8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u16 q0, [r1]
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <8 x i8>, <8 x i8>* %src, align 1
  %0 = zext <8 x i8> %wide.load to <8 x i16>
  store <8 x i16> %0, <8 x i16>* %dest, align 2
  ret void
}

define void @foo_uint32_uint16(<4 x i32>* %dest, <4 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint32_uint16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u32 q0, [r1]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i16>, <4 x i16>* %src, align 2
  %0 = zext <4 x i16> %wide.load to <4 x i32>
  store <4 x i32> %0, <4 x i32>* %dest, align 4
  ret void
}


define void @foo_uint32_uint8_double(<16 x i32>* %dest, <16 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint32_uint8_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u32 q0, [r1, #4]
; CHECK-NEXT:    vldrb.u32 q1, [r1]
; CHECK-NEXT:    vldrb.u32 q2, [r1, #12]
; CHECK-NEXT:    vldrb.u32 q3, [r1, #8]
; CHECK-NEXT:    vstrw.32 q1, [r0]
; CHECK-NEXT:    vstrw.32 q0, [r0, #16]
; CHECK-NEXT:    vstrw.32 q3, [r0, #32]
; CHECK-NEXT:    vstrw.32 q2, [r0, #48]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <16 x i8>, <16 x i8>* %src, align 1
  %0 = zext <16 x i8> %wide.load to <16 x i32>
  store <16 x i32> %0, <16 x i32>* %dest, align 4
  ret void
}

define void @foo_uint16_uint8_double(<16 x i16>* %dest, <16 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint16_uint8_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u16 q0, [r1]
; CHECK-NEXT:    vldrb.u16 q1, [r1, #8]
; CHECK-NEXT:    vstrh.16 q1, [r0, #16]
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <16 x i8>, <16 x i8>* %src, align 1
  %0 = zext <16 x i8> %wide.load to <16 x i16>
  store <16 x i16> %0, <16 x i16>* %dest, align 2
  ret void
}

define void @foo_uint32_uint16_double(<8 x i32>* %dest, <8 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint32_uint16_double:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u32 q0, [r1]
; CHECK-NEXT:    vldrh.u32 q1, [r1, #8]
; CHECK-NEXT:    vstrw.32 q1, [r0, #16]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <8 x i16>, <8 x i16>* %src, align 2
  %0 = zext <8 x i16> %wide.load to <8 x i32>
  store <8 x i32> %0, <8 x i32>* %dest, align 4
  ret void
}


define void @foo_int32_int8_both(<16 x i32>* %dest, <16 x i8>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int32_int8_both:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.s16 q1, [r1, #8]
; CHECK-NEXT:    vmov.u16 r2, q1[4]
; CHECK-NEXT:    vmov.32 q0[0], r2
; CHECK-NEXT:    vmov.u16 r2, q1[5]
; CHECK-NEXT:    vmov.32 q0[1], r2
; CHECK-NEXT:    vmov.u16 r2, q1[6]
; CHECK-NEXT:    vmov.32 q0[2], r2
; CHECK-NEXT:    vmov.u16 r2, q1[7]
; CHECK-NEXT:    vmov.32 q0[3], r2
; CHECK-NEXT:    vmovlb.u16 q2, q0
; CHECK-NEXT:    vldrb.s16 q0, [r1]
; CHECK-NEXT:    vmov.u16 r1, q1[0]
; CHECK-NEXT:    vstrw.32 q2, [r0, #48]
; CHECK-NEXT:    vmov.32 q2[0], r1
; CHECK-NEXT:    vmov.u16 r1, q1[1]
; CHECK-NEXT:    vmov.32 q2[1], r1
; CHECK-NEXT:    vmov.u16 r1, q1[2]
; CHECK-NEXT:    vmov.32 q2[2], r1
; CHECK-NEXT:    vmov.u16 r1, q1[3]
; CHECK-NEXT:    vmov.32 q2[3], r1
; CHECK-NEXT:    vmov.u16 r1, q0[4]
; CHECK-NEXT:    vmovlb.u16 q1, q2
; CHECK-NEXT:    vstrw.32 q1, [r0, #32]
; CHECK-NEXT:    vmov.32 q1[0], r1
; CHECK-NEXT:    vmov.u16 r1, q0[5]
; CHECK-NEXT:    vmov.32 q1[1], r1
; CHECK-NEXT:    vmov.u16 r1, q0[6]
; CHECK-NEXT:    vmov.32 q1[2], r1
; CHECK-NEXT:    vmov.u16 r1, q0[7]
; CHECK-NEXT:    vmov.32 q1[3], r1
; CHECK-NEXT:    vmov.u16 r1, q0[0]
; CHECK-NEXT:    vmovlb.u16 q1, q1
; CHECK-NEXT:    vstrw.32 q1, [r0, #16]
; CHECK-NEXT:    vmov.32 q1[0], r1
; CHECK-NEXT:    vmov.u16 r1, q0[1]
; CHECK-NEXT:    vmov.32 q1[1], r1
; CHECK-NEXT:    vmov.u16 r1, q0[2]
; CHECK-NEXT:    vmov.32 q1[2], r1
; CHECK-NEXT:    vmov.u16 r1, q0[3]
; CHECK-NEXT:    vmov.32 q1[3], r1
; CHECK-NEXT:    vmovlb.u16 q0, q1
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <16 x i8>, <16 x i8>* %src, align 1
  %0 = sext <16 x i8> %wide.load to <16 x i16>
  %1 = zext <16 x i16> %0 to <16 x i32>
  store <16 x i32> %1, <16 x i32>* %dest, align 4
  ret void
}

define <8 x i16>* @foo_uint32_uint16_double_offset(<8 x i32>* %dest, <8 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint32_uint16_double_offset:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.s32 q0, [r1, #16]!
; CHECK-NEXT:    vldrh.s32 q1, [r1, #8]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vstrw.32 q1, [r0, #16]
; CHECK-NEXT:    mov r0, r1
; CHECK-NEXT:    bx lr
entry:
  %z = getelementptr inbounds <8 x i16>, <8 x i16>* %src, i32 1
  %wide.load = load <8 x i16>, <8 x i16>* %z, align 2
  %0 = sext <8 x i16> %wide.load to <8 x i32>
  store <8 x i32> %0, <8 x i32>* %dest, align 4
  ret <8 x i16>* %z
}

define <16 x i16>* @foo_uint32_uint16_quad_offset(<16 x i32>* %dest, <16 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint32_uint16_quad_offset:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.s32 q0, [r1, #32]!
; CHECK-NEXT:    vldrh.s32 q1, [r1, #8]
; CHECK-NEXT:    vldrh.s32 q2, [r1, #24]
; CHECK-NEXT:    vldrh.s32 q3, [r1, #16]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    vstrw.32 q2, [r0, #48]
; CHECK-NEXT:    vstrw.32 q1, [r0, #16]
; CHECK-NEXT:    vstrw.32 q3, [r0, #32]
; CHECK-NEXT:    mov r0, r1
; CHECK-NEXT:    bx lr
entry:
  %z = getelementptr inbounds <16 x i16>, <16 x i16>* %src, i32 1
  %wide.load = load <16 x i16>, <16 x i16>* %z, align 2
  %0 = sext <16 x i16> %wide.load to <16 x i32>
  store <16 x i32> %0, <16 x i32>* %dest, align 4
  ret <16 x i16>* %z
}


define void @foo_int16_int32_align1(<4 x i16>* %dest, <4 x i32>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int16_int32_align1:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #8
; CHECK-NEXT:    sub sp, #8
; CHECK-NEXT:    vldrw.u32 q0, [r1]
; CHECK-NEXT:    mov r1, sp
; CHECK-NEXT:    vstrh.32 q0, [r1]
; CHECK-NEXT:    ldrd r1, r2, [sp]
; CHECK-NEXT:    str r1, [r0]
; CHECK-NEXT:    str r2, [r0, #4]
; CHECK-NEXT:    add sp, #8
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i32>, <4 x i32>* %src, align 4
  %0 = trunc <4 x i32> %wide.load to <4 x i16>
  store <4 x i16> %0, <4 x i16>* %dest, align 1
  ret void
}

define void @foo_int32_int16_align1(<4 x i32>* %dest, <4 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_int32_int16_align1:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #8
; CHECK-NEXT:    sub sp, #8
; CHECK-NEXT:    ldr r2, [r1]
; CHECK-NEXT:    ldr r1, [r1, #4]
; CHECK-NEXT:    strd r2, r1, [sp]
; CHECK-NEXT:    mov r1, sp
; CHECK-NEXT:    vldrh.s32 q0, [r1]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    add sp, #8
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i16>, <4 x i16>* %src, align 1
  %0 = sext <4 x i16> %wide.load to <4 x i32>
  store <4 x i32> %0, <4 x i32>* %dest, align 4
  ret void
}

define void @foo_uint32_uint16_align1(<4 x i32>* %dest, <4 x i16>* readonly %src, i32 %n) {
; CHECK-LABEL: foo_uint32_uint16_align1:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #8
; CHECK-NEXT:    sub sp, #8
; CHECK-NEXT:    ldr r2, [r1]
; CHECK-NEXT:    ldr r1, [r1, #4]
; CHECK-NEXT:    strd r2, r1, [sp]
; CHECK-NEXT:    mov r1, sp
; CHECK-NEXT:    vldrh.u32 q0, [r1]
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    add sp, #8
; CHECK-NEXT:    bx lr
entry:
  %wide.load = load <4 x i16>, <4 x i16>* %src, align 1
  %0 = zext <4 x i16> %wide.load to <4 x i32>
  store <4 x i32> %0, <4 x i32>* %dest, align 4
  ret void
}
