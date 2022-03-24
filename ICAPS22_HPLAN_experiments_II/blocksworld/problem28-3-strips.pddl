( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b939 - block
    b86 - block
    b186 - block
    b81 - block
    b893 - block
    b773 - block
    b779 - block
    b697 - block
    b746 - block
    b146 - block
    b110 - block
    b683 - block
    b633 - block
    b877 - block
    b631 - block
    b238 - block
    b268 - block
    b121 - block
    b38 - block
    b157 - block
    b759 - block
    b292 - block
    b318 - block
    b384 - block
    b839 - block
    b111 - block
    b691 - block
    b607 - block
    b222 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b939 )
    ( on b86 b939 )
    ( on b186 b86 )
    ( on b81 b186 )
    ( on b893 b81 )
    ( on b773 b893 )
    ( on b779 b773 )
    ( on b697 b779 )
    ( on b746 b697 )
    ( on b146 b746 )
    ( on b110 b146 )
    ( on b683 b110 )
    ( on b633 b683 )
    ( on b877 b633 )
    ( on b631 b877 )
    ( on b238 b631 )
    ( on b268 b238 )
    ( on b121 b268 )
    ( on b38 b121 )
    ( on b157 b38 )
    ( on b759 b157 )
    ( on b292 b759 )
    ( on b318 b292 )
    ( on b384 b318 )
    ( on b839 b384 )
    ( on b111 b839 )
    ( on b691 b111 )
    ( on b607 b691 )
    ( on b222 b607 )
    ( clear b222 )
  )
  ( :goal
    ( and
      ( clear b939 )
    )
  )
)
