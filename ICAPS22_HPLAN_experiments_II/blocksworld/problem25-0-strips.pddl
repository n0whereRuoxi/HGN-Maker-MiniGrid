( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b695 - block
    b559 - block
    b993 - block
    b328 - block
    b460 - block
    b40 - block
    b971 - block
    b882 - block
    b789 - block
    b999 - block
    b569 - block
    b850 - block
    b773 - block
    b655 - block
    b875 - block
    b519 - block
    b124 - block
    b611 - block
    b4 - block
    b381 - block
    b735 - block
    b652 - block
    b108 - block
    b302 - block
    b369 - block
    b319 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b695 )
    ( on b559 b695 )
    ( on b993 b559 )
    ( on b328 b993 )
    ( on b460 b328 )
    ( on b40 b460 )
    ( on b971 b40 )
    ( on b882 b971 )
    ( on b789 b882 )
    ( on b999 b789 )
    ( on b569 b999 )
    ( on b850 b569 )
    ( on b773 b850 )
    ( on b655 b773 )
    ( on b875 b655 )
    ( on b519 b875 )
    ( on b124 b519 )
    ( on b611 b124 )
    ( on b4 b611 )
    ( on b381 b4 )
    ( on b735 b381 )
    ( on b652 b735 )
    ( on b108 b652 )
    ( on b302 b108 )
    ( on b369 b302 )
    ( on b319 b369 )
    ( clear b319 )
  )
  ( :goal
    ( and
      ( clear b695 )
    )
  )
)
