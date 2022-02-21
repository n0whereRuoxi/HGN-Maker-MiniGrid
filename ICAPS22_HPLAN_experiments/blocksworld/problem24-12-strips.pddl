( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b200 - block
    b51 - block
    b114 - block
    b721 - block
    b912 - block
    b617 - block
    b297 - block
    b55 - block
    b890 - block
    b429 - block
    b901 - block
    b961 - block
    b465 - block
    b303 - block
    b98 - block
    b484 - block
    b422 - block
    b836 - block
    b655 - block
    b538 - block
    b195 - block
    b916 - block
    b834 - block
    b506 - block
    b433 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b200 )
    ( on b51 b200 )
    ( on b114 b51 )
    ( on b721 b114 )
    ( on b912 b721 )
    ( on b617 b912 )
    ( on b297 b617 )
    ( on b55 b297 )
    ( on b890 b55 )
    ( on b429 b890 )
    ( on b901 b429 )
    ( on b961 b901 )
    ( on b465 b961 )
    ( on b303 b465 )
    ( on b98 b303 )
    ( on b484 b98 )
    ( on b422 b484 )
    ( on b836 b422 )
    ( on b655 b836 )
    ( on b538 b655 )
    ( on b195 b538 )
    ( on b916 b195 )
    ( on b834 b916 )
    ( on b506 b834 )
    ( on b433 b506 )
    ( clear b433 )
  )
  ( :goal
    ( and
      ( clear b200 )
    )
  )
)
