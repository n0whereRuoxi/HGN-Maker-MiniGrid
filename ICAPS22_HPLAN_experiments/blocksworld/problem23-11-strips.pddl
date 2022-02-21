( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b227 - block
    b377 - block
    b432 - block
    b408 - block
    b229 - block
    b182 - block
    b813 - block
    b722 - block
    b356 - block
    b64 - block
    b836 - block
    b919 - block
    b194 - block
    b547 - block
    b762 - block
    b515 - block
    b454 - block
    b291 - block
    b721 - block
    b725 - block
    b179 - block
    b73 - block
    b882 - block
    b156 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b227 )
    ( on b377 b227 )
    ( on b432 b377 )
    ( on b408 b432 )
    ( on b229 b408 )
    ( on b182 b229 )
    ( on b813 b182 )
    ( on b722 b813 )
    ( on b356 b722 )
    ( on b64 b356 )
    ( on b836 b64 )
    ( on b919 b836 )
    ( on b194 b919 )
    ( on b547 b194 )
    ( on b762 b547 )
    ( on b515 b762 )
    ( on b454 b515 )
    ( on b291 b454 )
    ( on b721 b291 )
    ( on b725 b721 )
    ( on b179 b725 )
    ( on b73 b179 )
    ( on b882 b73 )
    ( on b156 b882 )
    ( clear b156 )
  )
  ( :goal
    ( and
      ( clear b227 )
    )
  )
)
