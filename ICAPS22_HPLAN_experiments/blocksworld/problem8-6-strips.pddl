( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b753 - block
    b989 - block
    b964 - block
    b752 - block
    b38 - block
    b64 - block
    b166 - block
    b512 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b753 )
    ( on b989 b753 )
    ( on b964 b989 )
    ( on b752 b964 )
    ( on b38 b752 )
    ( on b64 b38 )
    ( on b166 b64 )
    ( on b512 b166 )
    ( on b15 b512 )
    ( clear b15 )
  )
  ( :goal
    ( and
      ( clear b753 )
    )
  )
)
