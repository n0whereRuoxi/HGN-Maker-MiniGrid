( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b42 - block
    b964 - block
    b505 - block
    b93 - block
    b816 - block
    b802 - block
    b600 - block
    b873 - block
    b971 - block
    b576 - block
    b246 - block
    b778 - block
    b748 - block
    b807 - block
    b996 - block
    b479 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b42 )
    ( on b964 b42 )
    ( on b505 b964 )
    ( on b93 b505 )
    ( on b816 b93 )
    ( on b802 b816 )
    ( on b600 b802 )
    ( on b873 b600 )
    ( on b971 b873 )
    ( on b576 b971 )
    ( on b246 b576 )
    ( on b778 b246 )
    ( on b748 b778 )
    ( on b807 b748 )
    ( on b996 b807 )
    ( on b479 b996 )
    ( clear b479 )
  )
  ( :tasks
    ( Make-15Pile b964 b505 b93 b816 b802 b600 b873 b971 b576 b246 b778 b748 b807 b996 b479 )
  )
)
