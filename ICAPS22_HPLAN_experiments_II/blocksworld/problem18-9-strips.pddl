( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b16 - block
    b263 - block
    b49 - block
    b812 - block
    b450 - block
    b45 - block
    b866 - block
    b660 - block
    b244 - block
    b640 - block
    b914 - block
    b576 - block
    b577 - block
    b788 - block
    b742 - block
    b368 - block
    b671 - block
    b653 - block
    b260 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b16 )
    ( on b263 b16 )
    ( on b49 b263 )
    ( on b812 b49 )
    ( on b450 b812 )
    ( on b45 b450 )
    ( on b866 b45 )
    ( on b660 b866 )
    ( on b244 b660 )
    ( on b640 b244 )
    ( on b914 b640 )
    ( on b576 b914 )
    ( on b577 b576 )
    ( on b788 b577 )
    ( on b742 b788 )
    ( on b368 b742 )
    ( on b671 b368 )
    ( on b653 b671 )
    ( on b260 b653 )
    ( clear b260 )
  )
  ( :goal
    ( and
      ( clear b16 )
    )
  )
)
