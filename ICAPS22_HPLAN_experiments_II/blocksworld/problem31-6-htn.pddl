( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b156 - block
    b11 - block
    b150 - block
    b339 - block
    b998 - block
    b841 - block
    b62 - block
    b675 - block
    b82 - block
    b276 - block
    b379 - block
    b574 - block
    b86 - block
    b437 - block
    b875 - block
    b780 - block
    b164 - block
    b576 - block
    b238 - block
    b26 - block
    b590 - block
    b163 - block
    b369 - block
    b775 - block
    b838 - block
    b971 - block
    b236 - block
    b33 - block
    b88 - block
    b968 - block
    b54 - block
    b445 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b156 )
    ( on b11 b156 )
    ( on b150 b11 )
    ( on b339 b150 )
    ( on b998 b339 )
    ( on b841 b998 )
    ( on b62 b841 )
    ( on b675 b62 )
    ( on b82 b675 )
    ( on b276 b82 )
    ( on b379 b276 )
    ( on b574 b379 )
    ( on b86 b574 )
    ( on b437 b86 )
    ( on b875 b437 )
    ( on b780 b875 )
    ( on b164 b780 )
    ( on b576 b164 )
    ( on b238 b576 )
    ( on b26 b238 )
    ( on b590 b26 )
    ( on b163 b590 )
    ( on b369 b163 )
    ( on b775 b369 )
    ( on b838 b775 )
    ( on b971 b838 )
    ( on b236 b971 )
    ( on b33 b236 )
    ( on b88 b33 )
    ( on b968 b88 )
    ( on b54 b968 )
    ( on b445 b54 )
    ( clear b445 )
  )
  ( :tasks
    ( Make-31Pile b11 b150 b339 b998 b841 b62 b675 b82 b276 b379 b574 b86 b437 b875 b780 b164 b576 b238 b26 b590 b163 b369 b775 b838 b971 b236 b33 b88 b968 b54 b445 )
  )
)
