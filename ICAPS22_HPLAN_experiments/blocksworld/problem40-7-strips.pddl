( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b532 - block
    b905 - block
    b557 - block
    b344 - block
    b322 - block
    b548 - block
    b883 - block
    b506 - block
    b28 - block
    b442 - block
    b290 - block
    b870 - block
    b542 - block
    b862 - block
    b984 - block
    b479 - block
    b827 - block
    b605 - block
    b729 - block
    b835 - block
    b59 - block
    b643 - block
    b929 - block
    b32 - block
    b201 - block
    b333 - block
    b142 - block
    b405 - block
    b823 - block
    b493 - block
    b259 - block
    b792 - block
    b90 - block
    b312 - block
    b78 - block
    b805 - block
    b14 - block
    b462 - block
    b775 - block
    b797 - block
    b690 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b532 )
    ( on b905 b532 )
    ( on b557 b905 )
    ( on b344 b557 )
    ( on b322 b344 )
    ( on b548 b322 )
    ( on b883 b548 )
    ( on b506 b883 )
    ( on b28 b506 )
    ( on b442 b28 )
    ( on b290 b442 )
    ( on b870 b290 )
    ( on b542 b870 )
    ( on b862 b542 )
    ( on b984 b862 )
    ( on b479 b984 )
    ( on b827 b479 )
    ( on b605 b827 )
    ( on b729 b605 )
    ( on b835 b729 )
    ( on b59 b835 )
    ( on b643 b59 )
    ( on b929 b643 )
    ( on b32 b929 )
    ( on b201 b32 )
    ( on b333 b201 )
    ( on b142 b333 )
    ( on b405 b142 )
    ( on b823 b405 )
    ( on b493 b823 )
    ( on b259 b493 )
    ( on b792 b259 )
    ( on b90 b792 )
    ( on b312 b90 )
    ( on b78 b312 )
    ( on b805 b78 )
    ( on b14 b805 )
    ( on b462 b14 )
    ( on b775 b462 )
    ( on b797 b775 )
    ( on b690 b797 )
    ( clear b690 )
  )
  ( :goal
    ( and
      ( clear b532 )
    )
  )
)
