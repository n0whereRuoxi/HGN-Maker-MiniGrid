( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b253 - block
    b666 - block
    b713 - block
    b365 - block
    b30 - block
    b518 - block
    b525 - block
    b935 - block
    b672 - block
    b118 - block
    b164 - block
    b539 - block
    b981 - block
    b362 - block
    b222 - block
    b824 - block
    b639 - block
    b751 - block
    b867 - block
    b905 - block
    b912 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b253 )
    ( on b666 b253 )
    ( on b713 b666 )
    ( on b365 b713 )
    ( on b30 b365 )
    ( on b518 b30 )
    ( on b525 b518 )
    ( on b935 b525 )
    ( on b672 b935 )
    ( on b118 b672 )
    ( on b164 b118 )
    ( on b539 b164 )
    ( on b981 b539 )
    ( on b362 b981 )
    ( on b222 b362 )
    ( on b824 b222 )
    ( on b639 b824 )
    ( on b751 b639 )
    ( on b867 b751 )
    ( on b905 b867 )
    ( on b912 b905 )
    ( clear b912 )
  )
  ( :goal
    ( and
      ( clear b253 )
    )
  )
)
