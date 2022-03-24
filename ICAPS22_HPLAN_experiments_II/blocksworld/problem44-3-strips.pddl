( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b872 - block
    b513 - block
    b172 - block
    b290 - block
    b776 - block
    b49 - block
    b889 - block
    b967 - block
    b988 - block
    b933 - block
    b600 - block
    b756 - block
    b357 - block
    b951 - block
    b492 - block
    b605 - block
    b170 - block
    b610 - block
    b505 - block
    b777 - block
    b382 - block
    b250 - block
    b544 - block
    b171 - block
    b242 - block
    b503 - block
    b815 - block
    b757 - block
    b209 - block
    b583 - block
    b128 - block
    b959 - block
    b714 - block
    b518 - block
    b405 - block
    b43 - block
    b734 - block
    b165 - block
    b796 - block
    b18 - block
    b634 - block
    b31 - block
    b725 - block
    b879 - block
    b864 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b872 )
    ( on b513 b872 )
    ( on b172 b513 )
    ( on b290 b172 )
    ( on b776 b290 )
    ( on b49 b776 )
    ( on b889 b49 )
    ( on b967 b889 )
    ( on b988 b967 )
    ( on b933 b988 )
    ( on b600 b933 )
    ( on b756 b600 )
    ( on b357 b756 )
    ( on b951 b357 )
    ( on b492 b951 )
    ( on b605 b492 )
    ( on b170 b605 )
    ( on b610 b170 )
    ( on b505 b610 )
    ( on b777 b505 )
    ( on b382 b777 )
    ( on b250 b382 )
    ( on b544 b250 )
    ( on b171 b544 )
    ( on b242 b171 )
    ( on b503 b242 )
    ( on b815 b503 )
    ( on b757 b815 )
    ( on b209 b757 )
    ( on b583 b209 )
    ( on b128 b583 )
    ( on b959 b128 )
    ( on b714 b959 )
    ( on b518 b714 )
    ( on b405 b518 )
    ( on b43 b405 )
    ( on b734 b43 )
    ( on b165 b734 )
    ( on b796 b165 )
    ( on b18 b796 )
    ( on b634 b18 )
    ( on b31 b634 )
    ( on b725 b31 )
    ( on b879 b725 )
    ( on b864 b879 )
    ( clear b864 )
  )
  ( :goal
    ( and
      ( clear b872 )
    )
  )
)
