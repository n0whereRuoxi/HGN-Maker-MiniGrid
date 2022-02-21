( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b892 - block
    b869 - block
    b406 - block
    b415 - block
    b263 - block
    b653 - block
    b668 - block
    b615 - block
    b362 - block
    b906 - block
    b890 - block
    b564 - block
    b436 - block
    b226 - block
    b807 - block
    b177 - block
    b744 - block
    b192 - block
    b262 - block
    b999 - block
    b266 - block
    b660 - block
    b842 - block
    b189 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b892 )
    ( on b869 b892 )
    ( on b406 b869 )
    ( on b415 b406 )
    ( on b263 b415 )
    ( on b653 b263 )
    ( on b668 b653 )
    ( on b615 b668 )
    ( on b362 b615 )
    ( on b906 b362 )
    ( on b890 b906 )
    ( on b564 b890 )
    ( on b436 b564 )
    ( on b226 b436 )
    ( on b807 b226 )
    ( on b177 b807 )
    ( on b744 b177 )
    ( on b192 b744 )
    ( on b262 b192 )
    ( on b999 b262 )
    ( on b266 b999 )
    ( on b660 b266 )
    ( on b842 b660 )
    ( on b189 b842 )
    ( clear b189 )
  )
  ( :goal
    ( and
      ( clear b892 )
    )
  )
)
