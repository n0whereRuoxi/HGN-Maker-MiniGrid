( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b370 - block
    b797 - block
    b489 - block
    b224 - block
    b210 - block
    b995 - block
    b196 - block
    b672 - block
    b723 - block
    b170 - block
    b749 - block
    b202 - block
    b664 - block
    b316 - block
    b594 - block
    b713 - block
    b486 - block
    b506 - block
    b717 - block
    b937 - block
    b890 - block
    b238 - block
    b492 - block
    b568 - block
    b679 - block
    b103 - block
    b206 - block
    b367 - block
    b331 - block
    b655 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b370 )
    ( on b797 b370 )
    ( on b489 b797 )
    ( on b224 b489 )
    ( on b210 b224 )
    ( on b995 b210 )
    ( on b196 b995 )
    ( on b672 b196 )
    ( on b723 b672 )
    ( on b170 b723 )
    ( on b749 b170 )
    ( on b202 b749 )
    ( on b664 b202 )
    ( on b316 b664 )
    ( on b594 b316 )
    ( on b713 b594 )
    ( on b486 b713 )
    ( on b506 b486 )
    ( on b717 b506 )
    ( on b937 b717 )
    ( on b890 b937 )
    ( on b238 b890 )
    ( on b492 b238 )
    ( on b568 b492 )
    ( on b679 b568 )
    ( on b103 b679 )
    ( on b206 b103 )
    ( on b367 b206 )
    ( on b331 b367 )
    ( on b655 b331 )
    ( clear b655 )
  )
  ( :goal
    ( and
      ( clear b370 )
    )
  )
)
