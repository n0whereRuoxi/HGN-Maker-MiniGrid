( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b23 - block
    b152 - block
    b40 - block
    b606 - block
    b891 - block
    b862 - block
    b583 - block
    b843 - block
    b743 - block
    b120 - block
    b993 - block
    b406 - block
    b469 - block
    b906 - block
    b814 - block
    b217 - block
    b371 - block
    b287 - block
    b624 - block
    b573 - block
    b774 - block
    b794 - block
    b691 - block
    b952 - block
    b164 - block
    b194 - block
    b56 - block
    b758 - block
    b299 - block
    b435 - block
    b293 - block
    b374 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b23 )
    ( on b152 b23 )
    ( on b40 b152 )
    ( on b606 b40 )
    ( on b891 b606 )
    ( on b862 b891 )
    ( on b583 b862 )
    ( on b843 b583 )
    ( on b743 b843 )
    ( on b120 b743 )
    ( on b993 b120 )
    ( on b406 b993 )
    ( on b469 b406 )
    ( on b906 b469 )
    ( on b814 b906 )
    ( on b217 b814 )
    ( on b371 b217 )
    ( on b287 b371 )
    ( on b624 b287 )
    ( on b573 b624 )
    ( on b774 b573 )
    ( on b794 b774 )
    ( on b691 b794 )
    ( on b952 b691 )
    ( on b164 b952 )
    ( on b194 b164 )
    ( on b56 b194 )
    ( on b758 b56 )
    ( on b299 b758 )
    ( on b435 b299 )
    ( on b293 b435 )
    ( on b374 b293 )
    ( clear b374 )
  )
  ( :goal
    ( and
      ( clear b23 )
    )
  )
)
