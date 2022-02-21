( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b203 - block
    b490 - block
    b890 - block
    b166 - block
    b528 - block
    b100 - block
    b877 - block
    b907 - block
    b799 - block
    b594 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b203 )
    ( on b490 b203 )
    ( on b890 b490 )
    ( on b166 b890 )
    ( on b528 b166 )
    ( on b100 b528 )
    ( on b877 b100 )
    ( on b907 b877 )
    ( on b799 b907 )
    ( on b594 b799 )
    ( clear b594 )
  )
  ( :goal
    ( and
      ( clear b203 )
    )
  )
)
