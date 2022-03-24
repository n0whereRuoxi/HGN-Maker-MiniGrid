( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b376 - block
    b313 - block
    b417 - block
    b371 - block
    b604 - block
    b614 - block
    b596 - block
    b112 - block
    b343 - block
    b778 - block
    b995 - block
    b845 - block
    b865 - block
    b658 - block
    b408 - block
    b677 - block
    b838 - block
    b327 - block
    b414 - block
    b579 - block
    b206 - block
    b803 - block
    b232 - block
    b458 - block
    b703 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b376 )
    ( on b313 b376 )
    ( on b417 b313 )
    ( on b371 b417 )
    ( on b604 b371 )
    ( on b614 b604 )
    ( on b596 b614 )
    ( on b112 b596 )
    ( on b343 b112 )
    ( on b778 b343 )
    ( on b995 b778 )
    ( on b845 b995 )
    ( on b865 b845 )
    ( on b658 b865 )
    ( on b408 b658 )
    ( on b677 b408 )
    ( on b838 b677 )
    ( on b327 b838 )
    ( on b414 b327 )
    ( on b579 b414 )
    ( on b206 b579 )
    ( on b803 b206 )
    ( on b232 b803 )
    ( on b458 b232 )
    ( on b703 b458 )
    ( clear b703 )
  )
  ( :tasks
    ( Make-24Pile b313 b417 b371 b604 b614 b596 b112 b343 b778 b995 b845 b865 b658 b408 b677 b838 b327 b414 b579 b206 b803 b232 b458 b703 )
  )
)
