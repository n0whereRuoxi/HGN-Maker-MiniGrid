( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b680 - block
    b759 - block
    b192 - block
    b733 - block
    b260 - block
    b814 - block
    b818 - block
    b32 - block
    b330 - block
    b373 - block
    b110 - block
    b421 - block
    b948 - block
    b987 - block
    b699 - block
    b366 - block
    b125 - block
    b459 - block
    b971 - block
    b19 - block
    b847 - block
    b5 - block
    b159 - block
    b893 - block
    b609 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b680 )
    ( on b759 b680 )
    ( on b192 b759 )
    ( on b733 b192 )
    ( on b260 b733 )
    ( on b814 b260 )
    ( on b818 b814 )
    ( on b32 b818 )
    ( on b330 b32 )
    ( on b373 b330 )
    ( on b110 b373 )
    ( on b421 b110 )
    ( on b948 b421 )
    ( on b987 b948 )
    ( on b699 b987 )
    ( on b366 b699 )
    ( on b125 b366 )
    ( on b459 b125 )
    ( on b971 b459 )
    ( on b19 b971 )
    ( on b847 b19 )
    ( on b5 b847 )
    ( on b159 b5 )
    ( on b893 b159 )
    ( on b609 b893 )
    ( clear b609 )
  )
  ( :goal
    ( and
      ( clear b680 )
    )
  )
)
