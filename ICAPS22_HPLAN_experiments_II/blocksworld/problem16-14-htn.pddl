( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b767 - block
    b955 - block
    b439 - block
    b846 - block
    b263 - block
    b12 - block
    b276 - block
    b603 - block
    b350 - block
    b785 - block
    b118 - block
    b884 - block
    b914 - block
    b866 - block
    b424 - block
    b407 - block
    b544 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b767 )
    ( on b955 b767 )
    ( on b439 b955 )
    ( on b846 b439 )
    ( on b263 b846 )
    ( on b12 b263 )
    ( on b276 b12 )
    ( on b603 b276 )
    ( on b350 b603 )
    ( on b785 b350 )
    ( on b118 b785 )
    ( on b884 b118 )
    ( on b914 b884 )
    ( on b866 b914 )
    ( on b424 b866 )
    ( on b407 b424 )
    ( on b544 b407 )
    ( clear b544 )
  )
  ( :tasks
    ( Make-16Pile b955 b439 b846 b263 b12 b276 b603 b350 b785 b118 b884 b914 b866 b424 b407 b544 )
  )
)
