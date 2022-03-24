( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b916 - block
    b359 - block
    b497 - block
    b957 - block
    b401 - block
    b758 - block
    b95 - block
    b232 - block
    b172 - block
    b385 - block
    b77 - block
    b521 - block
    b857 - block
    b15 - block
    b918 - block
    b703 - block
    b836 - block
    b814 - block
    b995 - block
    b626 - block
    b721 - block
    b268 - block
    b545 - block
    b808 - block
    b210 - block
    b145 - block
    b417 - block
    b464 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b916 )
    ( on b359 b916 )
    ( on b497 b359 )
    ( on b957 b497 )
    ( on b401 b957 )
    ( on b758 b401 )
    ( on b95 b758 )
    ( on b232 b95 )
    ( on b172 b232 )
    ( on b385 b172 )
    ( on b77 b385 )
    ( on b521 b77 )
    ( on b857 b521 )
    ( on b15 b857 )
    ( on b918 b15 )
    ( on b703 b918 )
    ( on b836 b703 )
    ( on b814 b836 )
    ( on b995 b814 )
    ( on b626 b995 )
    ( on b721 b626 )
    ( on b268 b721 )
    ( on b545 b268 )
    ( on b808 b545 )
    ( on b210 b808 )
    ( on b145 b210 )
    ( on b417 b145 )
    ( on b464 b417 )
    ( clear b464 )
  )
  ( :tasks
    ( Make-27Pile b359 b497 b957 b401 b758 b95 b232 b172 b385 b77 b521 b857 b15 b918 b703 b836 b814 b995 b626 b721 b268 b545 b808 b210 b145 b417 b464 )
  )
)
