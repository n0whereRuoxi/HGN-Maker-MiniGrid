( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b462 - block
    b481 - block
    b5 - block
    b436 - block
    b877 - block
    b905 - block
    b271 - block
    b463 - block
    b803 - block
    b99 - block
    b971 - block
    b16 - block
    b545 - block
    b420 - block
    b607 - block
    b189 - block
    b4 - block
    b802 - block
    b434 - block
    b450 - block
    b524 - block
    b66 - block
    b972 - block
    b930 - block
    b375 - block
    b85 - block
    b770 - block
    b471 - block
    b513 - block
    b14 - block
    b551 - block
    b259 - block
    b425 - block
    b795 - block
    b659 - block
    b566 - block
    b662 - block
    b316 - block
    b77 - block
    b179 - block
    b292 - block
    b562 - block
    b216 - block
    b140 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b462 )
    ( on b481 b462 )
    ( on b5 b481 )
    ( on b436 b5 )
    ( on b877 b436 )
    ( on b905 b877 )
    ( on b271 b905 )
    ( on b463 b271 )
    ( on b803 b463 )
    ( on b99 b803 )
    ( on b971 b99 )
    ( on b16 b971 )
    ( on b545 b16 )
    ( on b420 b545 )
    ( on b607 b420 )
    ( on b189 b607 )
    ( on b4 b189 )
    ( on b802 b4 )
    ( on b434 b802 )
    ( on b450 b434 )
    ( on b524 b450 )
    ( on b66 b524 )
    ( on b972 b66 )
    ( on b930 b972 )
    ( on b375 b930 )
    ( on b85 b375 )
    ( on b770 b85 )
    ( on b471 b770 )
    ( on b513 b471 )
    ( on b14 b513 )
    ( on b551 b14 )
    ( on b259 b551 )
    ( on b425 b259 )
    ( on b795 b425 )
    ( on b659 b795 )
    ( on b566 b659 )
    ( on b662 b566 )
    ( on b316 b662 )
    ( on b77 b316 )
    ( on b179 b77 )
    ( on b292 b179 )
    ( on b562 b292 )
    ( on b216 b562 )
    ( on b140 b216 )
    ( clear b140 )
  )
  ( :goal
    ( and
      ( clear b462 )
    )
  )
)
