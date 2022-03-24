( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b40 - block
    b225 - block
    b838 - block
    b770 - block
    b686 - block
    b218 - block
    b535 - block
    b450 - block
    b399 - block
    b227 - block
    b409 - block
    b990 - block
    b92 - block
    b231 - block
    b413 - block
    b286 - block
    b457 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b40 )
    ( on b225 b40 )
    ( on b838 b225 )
    ( on b770 b838 )
    ( on b686 b770 )
    ( on b218 b686 )
    ( on b535 b218 )
    ( on b450 b535 )
    ( on b399 b450 )
    ( on b227 b399 )
    ( on b409 b227 )
    ( on b990 b409 )
    ( on b92 b990 )
    ( on b231 b92 )
    ( on b413 b231 )
    ( on b286 b413 )
    ( on b457 b286 )
    ( clear b457 )
  )
  ( :tasks
    ( Make-16Pile b225 b838 b770 b686 b218 b535 b450 b399 b227 b409 b990 b92 b231 b413 b286 b457 )
  )
)
