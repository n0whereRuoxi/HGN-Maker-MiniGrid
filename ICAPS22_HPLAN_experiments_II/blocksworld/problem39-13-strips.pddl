( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b514 - block
    b221 - block
    b803 - block
    b763 - block
    b839 - block
    b435 - block
    b158 - block
    b517 - block
    b523 - block
    b856 - block
    b675 - block
    b323 - block
    b251 - block
    b374 - block
    b206 - block
    b930 - block
    b352 - block
    b273 - block
    b990 - block
    b598 - block
    b134 - block
    b401 - block
    b25 - block
    b301 - block
    b735 - block
    b787 - block
    b483 - block
    b737 - block
    b997 - block
    b560 - block
    b229 - block
    b496 - block
    b802 - block
    b758 - block
    b685 - block
    b297 - block
    b260 - block
    b232 - block
    b130 - block
    b201 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b514 )
    ( on b221 b514 )
    ( on b803 b221 )
    ( on b763 b803 )
    ( on b839 b763 )
    ( on b435 b839 )
    ( on b158 b435 )
    ( on b517 b158 )
    ( on b523 b517 )
    ( on b856 b523 )
    ( on b675 b856 )
    ( on b323 b675 )
    ( on b251 b323 )
    ( on b374 b251 )
    ( on b206 b374 )
    ( on b930 b206 )
    ( on b352 b930 )
    ( on b273 b352 )
    ( on b990 b273 )
    ( on b598 b990 )
    ( on b134 b598 )
    ( on b401 b134 )
    ( on b25 b401 )
    ( on b301 b25 )
    ( on b735 b301 )
    ( on b787 b735 )
    ( on b483 b787 )
    ( on b737 b483 )
    ( on b997 b737 )
    ( on b560 b997 )
    ( on b229 b560 )
    ( on b496 b229 )
    ( on b802 b496 )
    ( on b758 b802 )
    ( on b685 b758 )
    ( on b297 b685 )
    ( on b260 b297 )
    ( on b232 b260 )
    ( on b130 b232 )
    ( on b201 b130 )
    ( clear b201 )
  )
  ( :goal
    ( and
      ( clear b514 )
    )
  )
)
