( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b700 - block
    b250 - block
    b324 - block
    b256 - block
    b540 - block
    b905 - block
    b603 - block
    b761 - block
    b622 - block
    b329 - block
    b674 - block
    b410 - block
    b712 - block
    b180 - block
    b156 - block
    b611 - block
    b221 - block
    b692 - block
    b10 - block
    b798 - block
    b357 - block
    b204 - block
    b864 - block
    b823 - block
    b651 - block
    b992 - block
    b153 - block
    b131 - block
    b874 - block
    b508 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b700 )
    ( on b250 b700 )
    ( on b324 b250 )
    ( on b256 b324 )
    ( on b540 b256 )
    ( on b905 b540 )
    ( on b603 b905 )
    ( on b761 b603 )
    ( on b622 b761 )
    ( on b329 b622 )
    ( on b674 b329 )
    ( on b410 b674 )
    ( on b712 b410 )
    ( on b180 b712 )
    ( on b156 b180 )
    ( on b611 b156 )
    ( on b221 b611 )
    ( on b692 b221 )
    ( on b10 b692 )
    ( on b798 b10 )
    ( on b357 b798 )
    ( on b204 b357 )
    ( on b864 b204 )
    ( on b823 b864 )
    ( on b651 b823 )
    ( on b992 b651 )
    ( on b153 b992 )
    ( on b131 b153 )
    ( on b874 b131 )
    ( on b508 b874 )
    ( clear b508 )
  )
  ( :goal
    ( and
      ( clear b700 )
    )
  )
)
