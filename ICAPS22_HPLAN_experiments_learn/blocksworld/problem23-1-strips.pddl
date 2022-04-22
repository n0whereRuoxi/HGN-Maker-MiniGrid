( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b266 - block
    b845 - block
    b280 - block
    b317 - block
    b900 - block
    b760 - block
    b574 - block
    b114 - block
    b338 - block
    b369 - block
    b766 - block
    b913 - block
    b420 - block
    b265 - block
    b393 - block
    b649 - block
    b440 - block
    b682 - block
    b101 - block
    b144 - block
    b224 - block
    b768 - block
    b861 - block
    b276 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b266 )
    ( on b845 b266 )
    ( on b280 b845 )
    ( on b317 b280 )
    ( on b900 b317 )
    ( on b760 b900 )
    ( on b574 b760 )
    ( on b114 b574 )
    ( on b338 b114 )
    ( on b369 b338 )
    ( on b766 b369 )
    ( on b913 b766 )
    ( on b420 b913 )
    ( on b265 b420 )
    ( on b393 b265 )
    ( on b649 b393 )
    ( on b440 b649 )
    ( on b682 b440 )
    ( on b101 b682 )
    ( on b144 b101 )
    ( on b224 b144 )
    ( on b768 b224 )
    ( on b861 b768 )
    ( on b276 b861 )
    ( clear b276 )
  )
  ( :goal
    ( and
      ( clear b266 )
    )
  )
)
