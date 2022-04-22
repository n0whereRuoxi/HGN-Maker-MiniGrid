( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b972 - block
    b430 - block
    b821 - block
    b80 - block
    b136 - block
    b882 - block
    b507 - block
    b883 - block
    b190 - block
    b522 - block
    b682 - block
    b613 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b972 )
    ( on b430 b972 )
    ( on b821 b430 )
    ( on b80 b821 )
    ( on b136 b80 )
    ( on b882 b136 )
    ( on b507 b882 )
    ( on b883 b507 )
    ( on b190 b883 )
    ( on b522 b190 )
    ( on b682 b522 )
    ( on b613 b682 )
    ( clear b613 )
  )
  ( :goal
    ( and
      ( clear b972 )
    )
  )
)
