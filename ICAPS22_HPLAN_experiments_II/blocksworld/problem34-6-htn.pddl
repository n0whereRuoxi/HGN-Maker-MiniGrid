( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b166 - block
    b34 - block
    b853 - block
    b744 - block
    b170 - block
    b794 - block
    b436 - block
    b377 - block
    b211 - block
    b151 - block
    b974 - block
    b248 - block
    b986 - block
    b424 - block
    b30 - block
    b323 - block
    b692 - block
    b57 - block
    b681 - block
    b150 - block
    b294 - block
    b932 - block
    b50 - block
    b135 - block
    b131 - block
    b686 - block
    b365 - block
    b573 - block
    b961 - block
    b91 - block
    b940 - block
    b909 - block
    b235 - block
    b858 - block
    b769 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b166 )
    ( on b34 b166 )
    ( on b853 b34 )
    ( on b744 b853 )
    ( on b170 b744 )
    ( on b794 b170 )
    ( on b436 b794 )
    ( on b377 b436 )
    ( on b211 b377 )
    ( on b151 b211 )
    ( on b974 b151 )
    ( on b248 b974 )
    ( on b986 b248 )
    ( on b424 b986 )
    ( on b30 b424 )
    ( on b323 b30 )
    ( on b692 b323 )
    ( on b57 b692 )
    ( on b681 b57 )
    ( on b150 b681 )
    ( on b294 b150 )
    ( on b932 b294 )
    ( on b50 b932 )
    ( on b135 b50 )
    ( on b131 b135 )
    ( on b686 b131 )
    ( on b365 b686 )
    ( on b573 b365 )
    ( on b961 b573 )
    ( on b91 b961 )
    ( on b940 b91 )
    ( on b909 b940 )
    ( on b235 b909 )
    ( on b858 b235 )
    ( on b769 b858 )
    ( clear b769 )
  )
  ( :tasks
    ( Make-34Pile b34 b853 b744 b170 b794 b436 b377 b211 b151 b974 b248 b986 b424 b30 b323 b692 b57 b681 b150 b294 b932 b50 b135 b131 b686 b365 b573 b961 b91 b940 b909 b235 b858 b769 )
  )
)
