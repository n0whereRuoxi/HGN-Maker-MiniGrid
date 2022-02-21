( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b225 - block
    b891 - block
    b843 - block
    b9 - block
    b578 - block
    b989 - block
    b158 - block
    b594 - block
    b260 - block
    b450 - block
    b659 - block
    b844 - block
    b916 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b225 )
    ( on b891 b225 )
    ( on b843 b891 )
    ( on b9 b843 )
    ( on b578 b9 )
    ( on b989 b578 )
    ( on b158 b989 )
    ( on b594 b158 )
    ( on b260 b594 )
    ( on b450 b260 )
    ( on b659 b450 )
    ( on b844 b659 )
    ( on b916 b844 )
    ( clear b916 )
  )
  ( :goal
    ( and
      ( clear b225 )
    )
  )
)
