( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b934 - block
    b501 - block
    b524 - block
    b552 - block
    b477 - block
    b532 - block
    b211 - block
    b274 - block
    b241 - block
    b38 - block
    b162 - block
    b100 - block
    b389 - block
    b256 - block
    b657 - block
    b155 - block
    b853 - block
    b33 - block
    b643 - block
    b615 - block
    b759 - block
    b782 - block
    b315 - block
    b420 - block
    b421 - block
    b948 - block
    b525 - block
    b693 - block
    b688 - block
    b764 - block
    b728 - block
    b96 - block
    b317 - block
    b898 - block
    b863 - block
    b486 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b934 )
    ( on b501 b934 )
    ( on b524 b501 )
    ( on b552 b524 )
    ( on b477 b552 )
    ( on b532 b477 )
    ( on b211 b532 )
    ( on b274 b211 )
    ( on b241 b274 )
    ( on b38 b241 )
    ( on b162 b38 )
    ( on b100 b162 )
    ( on b389 b100 )
    ( on b256 b389 )
    ( on b657 b256 )
    ( on b155 b657 )
    ( on b853 b155 )
    ( on b33 b853 )
    ( on b643 b33 )
    ( on b615 b643 )
    ( on b759 b615 )
    ( on b782 b759 )
    ( on b315 b782 )
    ( on b420 b315 )
    ( on b421 b420 )
    ( on b948 b421 )
    ( on b525 b948 )
    ( on b693 b525 )
    ( on b688 b693 )
    ( on b764 b688 )
    ( on b728 b764 )
    ( on b96 b728 )
    ( on b317 b96 )
    ( on b898 b317 )
    ( on b863 b898 )
    ( on b486 b863 )
    ( clear b486 )
  )
  ( :goal
    ( and
      ( clear b934 )
    )
  )
)
