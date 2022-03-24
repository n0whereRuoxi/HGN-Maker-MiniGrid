( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b690 - block
    b283 - block
    b668 - block
    b590 - block
    b773 - block
    b901 - block
    b325 - block
    b560 - block
    b936 - block
    b797 - block
    b698 - block
    b255 - block
    b228 - block
    b346 - block
    b171 - block
    b47 - block
    b93 - block
    b776 - block
    b477 - block
    b557 - block
    b437 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b690 )
    ( on b283 b690 )
    ( on b668 b283 )
    ( on b590 b668 )
    ( on b773 b590 )
    ( on b901 b773 )
    ( on b325 b901 )
    ( on b560 b325 )
    ( on b936 b560 )
    ( on b797 b936 )
    ( on b698 b797 )
    ( on b255 b698 )
    ( on b228 b255 )
    ( on b346 b228 )
    ( on b171 b346 )
    ( on b47 b171 )
    ( on b93 b47 )
    ( on b776 b93 )
    ( on b477 b776 )
    ( on b557 b477 )
    ( on b437 b557 )
    ( clear b437 )
  )
  ( :goal
    ( and
      ( clear b690 )
    )
  )
)
