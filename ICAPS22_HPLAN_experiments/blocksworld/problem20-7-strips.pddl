( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b919 - block
    b307 - block
    b147 - block
    b309 - block
    b340 - block
    b782 - block
    b558 - block
    b384 - block
    b785 - block
    b799 - block
    b737 - block
    b27 - block
    b484 - block
    b866 - block
    b601 - block
    b267 - block
    b325 - block
    b473 - block
    b803 - block
    b952 - block
    b192 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b919 )
    ( on b307 b919 )
    ( on b147 b307 )
    ( on b309 b147 )
    ( on b340 b309 )
    ( on b782 b340 )
    ( on b558 b782 )
    ( on b384 b558 )
    ( on b785 b384 )
    ( on b799 b785 )
    ( on b737 b799 )
    ( on b27 b737 )
    ( on b484 b27 )
    ( on b866 b484 )
    ( on b601 b866 )
    ( on b267 b601 )
    ( on b325 b267 )
    ( on b473 b325 )
    ( on b803 b473 )
    ( on b952 b803 )
    ( on b192 b952 )
    ( clear b192 )
  )
  ( :goal
    ( and
      ( clear b919 )
    )
  )
)
