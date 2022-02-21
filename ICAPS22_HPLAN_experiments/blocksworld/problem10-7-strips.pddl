( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b42 - block
    b89 - block
    b287 - block
    b393 - block
    b439 - block
    b682 - block
    b780 - block
    b851 - block
    b725 - block
    b814 - block
    b594 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b42 )
    ( on b89 b42 )
    ( on b287 b89 )
    ( on b393 b287 )
    ( on b439 b393 )
    ( on b682 b439 )
    ( on b780 b682 )
    ( on b851 b780 )
    ( on b725 b851 )
    ( on b814 b725 )
    ( on b594 b814 )
    ( clear b594 )
  )
  ( :goal
    ( and
      ( clear b42 )
    )
  )
)
