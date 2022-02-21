( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b930 - block
    b726 - block
    b867 - block
    b707 - block
    b944 - block
    b559 - block
    b164 - block
    b419 - block
    b847 - block
    b522 - block
    b359 - block
    b369 - block
    b222 - block
    b813 - block
    b790 - block
    b690 - block
    b817 - block
    b275 - block
    b793 - block
    b770 - block
    b449 - block
    b487 - block
    b908 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b930 )
    ( on b726 b930 )
    ( on b867 b726 )
    ( on b707 b867 )
    ( on b944 b707 )
    ( on b559 b944 )
    ( on b164 b559 )
    ( on b419 b164 )
    ( on b847 b419 )
    ( on b522 b847 )
    ( on b359 b522 )
    ( on b369 b359 )
    ( on b222 b369 )
    ( on b813 b222 )
    ( on b790 b813 )
    ( on b690 b790 )
    ( on b817 b690 )
    ( on b275 b817 )
    ( on b793 b275 )
    ( on b770 b793 )
    ( on b449 b770 )
    ( on b487 b449 )
    ( on b908 b487 )
    ( clear b908 )
  )
  ( :goal
    ( and
      ( clear b930 )
    )
  )
)
