( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b61 - block
    b596 - block
    b879 - block
    b615 - block
    b737 - block
    b902 - block
    b533 - block
    b413 - block
    b176 - block
    b971 - block
    b718 - block
    b851 - block
    b28 - block
    b886 - block
    b636 - block
    b264 - block
    b137 - block
    b704 - block
    b910 - block
    b502 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b61 )
    ( on b596 b61 )
    ( on b879 b596 )
    ( on b615 b879 )
    ( on b737 b615 )
    ( on b902 b737 )
    ( on b533 b902 )
    ( on b413 b533 )
    ( on b176 b413 )
    ( on b971 b176 )
    ( on b718 b971 )
    ( on b851 b718 )
    ( on b28 b851 )
    ( on b886 b28 )
    ( on b636 b886 )
    ( on b264 b636 )
    ( on b137 b264 )
    ( on b704 b137 )
    ( on b910 b704 )
    ( on b502 b910 )
    ( clear b502 )
  )
  ( :tasks
    ( Make-19Pile b596 b879 b615 b737 b902 b533 b413 b176 b971 b718 b851 b28 b886 b636 b264 b137 b704 b910 b502 )
  )
)
