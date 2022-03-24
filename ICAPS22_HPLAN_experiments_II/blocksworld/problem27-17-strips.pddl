( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b29 - block
    b904 - block
    b958 - block
    b322 - block
    b762 - block
    b676 - block
    b439 - block
    b60 - block
    b726 - block
    b976 - block
    b162 - block
    b469 - block
    b166 - block
    b445 - block
    b933 - block
    b696 - block
    b156 - block
    b472 - block
    b556 - block
    b160 - block
    b568 - block
    b517 - block
    b920 - block
    b157 - block
    b590 - block
    b800 - block
    b627 - block
    b158 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b29 )
    ( on b904 b29 )
    ( on b958 b904 )
    ( on b322 b958 )
    ( on b762 b322 )
    ( on b676 b762 )
    ( on b439 b676 )
    ( on b60 b439 )
    ( on b726 b60 )
    ( on b976 b726 )
    ( on b162 b976 )
    ( on b469 b162 )
    ( on b166 b469 )
    ( on b445 b166 )
    ( on b933 b445 )
    ( on b696 b933 )
    ( on b156 b696 )
    ( on b472 b156 )
    ( on b556 b472 )
    ( on b160 b556 )
    ( on b568 b160 )
    ( on b517 b568 )
    ( on b920 b517 )
    ( on b157 b920 )
    ( on b590 b157 )
    ( on b800 b590 )
    ( on b627 b800 )
    ( on b158 b627 )
    ( clear b158 )
  )
  ( :goal
    ( and
      ( clear b29 )
    )
  )
)
