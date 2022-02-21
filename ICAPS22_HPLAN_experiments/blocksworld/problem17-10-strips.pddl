( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b957 - block
    b420 - block
    b194 - block
    b777 - block
    b819 - block
    b511 - block
    b676 - block
    b861 - block
    b311 - block
    b39 - block
    b873 - block
    b278 - block
    b129 - block
    b474 - block
    b898 - block
    b709 - block
    b380 - block
    b54 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b957 )
    ( on b420 b957 )
    ( on b194 b420 )
    ( on b777 b194 )
    ( on b819 b777 )
    ( on b511 b819 )
    ( on b676 b511 )
    ( on b861 b676 )
    ( on b311 b861 )
    ( on b39 b311 )
    ( on b873 b39 )
    ( on b278 b873 )
    ( on b129 b278 )
    ( on b474 b129 )
    ( on b898 b474 )
    ( on b709 b898 )
    ( on b380 b709 )
    ( on b54 b380 )
    ( clear b54 )
  )
  ( :goal
    ( and
      ( clear b957 )
    )
  )
)
