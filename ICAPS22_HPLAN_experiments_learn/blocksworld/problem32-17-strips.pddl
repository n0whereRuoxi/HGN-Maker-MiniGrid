( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b35 - block
    b343 - block
    b763 - block
    b991 - block
    b405 - block
    b8 - block
    b994 - block
    b908 - block
    b837 - block
    b544 - block
    b291 - block
    b730 - block
    b541 - block
    b254 - block
    b903 - block
    b355 - block
    b963 - block
    b142 - block
    b565 - block
    b116 - block
    b737 - block
    b814 - block
    b57 - block
    b830 - block
    b808 - block
    b917 - block
    b864 - block
    b370 - block
    b626 - block
    b135 - block
    b969 - block
    b875 - block
    b202 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b35 )
    ( on b343 b35 )
    ( on b763 b343 )
    ( on b991 b763 )
    ( on b405 b991 )
    ( on b8 b405 )
    ( on b994 b8 )
    ( on b908 b994 )
    ( on b837 b908 )
    ( on b544 b837 )
    ( on b291 b544 )
    ( on b730 b291 )
    ( on b541 b730 )
    ( on b254 b541 )
    ( on b903 b254 )
    ( on b355 b903 )
    ( on b963 b355 )
    ( on b142 b963 )
    ( on b565 b142 )
    ( on b116 b565 )
    ( on b737 b116 )
    ( on b814 b737 )
    ( on b57 b814 )
    ( on b830 b57 )
    ( on b808 b830 )
    ( on b917 b808 )
    ( on b864 b917 )
    ( on b370 b864 )
    ( on b626 b370 )
    ( on b135 b626 )
    ( on b969 b135 )
    ( on b875 b969 )
    ( on b202 b875 )
    ( clear b202 )
  )
  ( :goal
    ( and
      ( clear b35 )
    )
  )
)
