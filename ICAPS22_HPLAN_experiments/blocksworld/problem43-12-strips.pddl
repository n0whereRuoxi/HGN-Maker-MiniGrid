( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b508 - block
    b853 - block
    b250 - block
    b900 - block
    b94 - block
    b14 - block
    b125 - block
    b90 - block
    b512 - block
    b182 - block
    b511 - block
    b671 - block
    b112 - block
    b255 - block
    b331 - block
    b26 - block
    b530 - block
    b4 - block
    b253 - block
    b770 - block
    b450 - block
    b136 - block
    b721 - block
    b977 - block
    b174 - block
    b484 - block
    b665 - block
    b971 - block
    b713 - block
    b660 - block
    b8 - block
    b323 - block
    b10 - block
    b486 - block
    b887 - block
    b424 - block
    b993 - block
    b432 - block
    b913 - block
    b516 - block
    b436 - block
    b688 - block
    b849 - block
    b801 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b508 )
    ( on b853 b508 )
    ( on b250 b853 )
    ( on b900 b250 )
    ( on b94 b900 )
    ( on b14 b94 )
    ( on b125 b14 )
    ( on b90 b125 )
    ( on b512 b90 )
    ( on b182 b512 )
    ( on b511 b182 )
    ( on b671 b511 )
    ( on b112 b671 )
    ( on b255 b112 )
    ( on b331 b255 )
    ( on b26 b331 )
    ( on b530 b26 )
    ( on b4 b530 )
    ( on b253 b4 )
    ( on b770 b253 )
    ( on b450 b770 )
    ( on b136 b450 )
    ( on b721 b136 )
    ( on b977 b721 )
    ( on b174 b977 )
    ( on b484 b174 )
    ( on b665 b484 )
    ( on b971 b665 )
    ( on b713 b971 )
    ( on b660 b713 )
    ( on b8 b660 )
    ( on b323 b8 )
    ( on b10 b323 )
    ( on b486 b10 )
    ( on b887 b486 )
    ( on b424 b887 )
    ( on b993 b424 )
    ( on b432 b993 )
    ( on b913 b432 )
    ( on b516 b913 )
    ( on b436 b516 )
    ( on b688 b436 )
    ( on b849 b688 )
    ( on b801 b849 )
    ( clear b801 )
  )
  ( :goal
    ( and
      ( clear b508 )
    )
  )
)
