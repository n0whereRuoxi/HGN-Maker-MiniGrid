( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b36 - block
    b966 - block
    b890 - block
    b573 - block
    b671 - block
    b203 - block
    b125 - block
    b462 - block
    b792 - block
    b568 - block
    b190 - block
    b932 - block
    b672 - block
    b742 - block
    b21 - block
    b321 - block
    b339 - block
    b812 - block
    b958 - block
    b753 - block
    b440 - block
    b171 - block
    b286 - block
    b374 - block
    b652 - block
    b740 - block
    b909 - block
    b71 - block
    b453 - block
    b995 - block
    b943 - block
    b535 - block
    b476 - block
    b308 - block
    b111 - block
    b540 - block
    b641 - block
    b337 - block
    b755 - block
    b309 - block
    b335 - block
    b658 - block
    b680 - block
    b169 - block
    b108 - block
    b797 - block
    b929 - block
    b239 - block
    b369 - block
    b819 - block
    b399 - block
    b253 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b36 )
    ( on b966 b36 )
    ( on b890 b966 )
    ( on b573 b890 )
    ( on b671 b573 )
    ( on b203 b671 )
    ( on b125 b203 )
    ( on b462 b125 )
    ( on b792 b462 )
    ( on b568 b792 )
    ( on b190 b568 )
    ( on b932 b190 )
    ( on b672 b932 )
    ( on b742 b672 )
    ( on b21 b742 )
    ( on b321 b21 )
    ( on b339 b321 )
    ( on b812 b339 )
    ( on b958 b812 )
    ( on b753 b958 )
    ( on b440 b753 )
    ( on b171 b440 )
    ( on b286 b171 )
    ( on b374 b286 )
    ( on b652 b374 )
    ( on b740 b652 )
    ( on b909 b740 )
    ( on b71 b909 )
    ( on b453 b71 )
    ( on b995 b453 )
    ( on b943 b995 )
    ( on b535 b943 )
    ( on b476 b535 )
    ( on b308 b476 )
    ( on b111 b308 )
    ( on b540 b111 )
    ( on b641 b540 )
    ( on b337 b641 )
    ( on b755 b337 )
    ( on b309 b755 )
    ( on b335 b309 )
    ( on b658 b335 )
    ( on b680 b658 )
    ( on b169 b680 )
    ( on b108 b169 )
    ( on b797 b108 )
    ( on b929 b797 )
    ( on b239 b929 )
    ( on b369 b239 )
    ( on b819 b369 )
    ( on b399 b819 )
    ( on b253 b399 )
    ( clear b253 )
  )
  ( :goal
    ( and
      ( clear b36 )
    )
  )
)
