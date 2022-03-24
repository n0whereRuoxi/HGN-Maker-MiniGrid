( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b439 - block
    b729 - block
    b806 - block
    b171 - block
    b413 - block
    b369 - block
    b57 - block
    b774 - block
    b937 - block
    b15 - block
    b80 - block
    b754 - block
    b940 - block
    b186 - block
    b225 - block
    b402 - block
    b386 - block
    b300 - block
    b952 - block
    b332 - block
    b388 - block
    b88 - block
    b262 - block
    b59 - block
    b801 - block
    b295 - block
    b504 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b439 )
    ( on b729 b439 )
    ( on b806 b729 )
    ( on b171 b806 )
    ( on b413 b171 )
    ( on b369 b413 )
    ( on b57 b369 )
    ( on b774 b57 )
    ( on b937 b774 )
    ( on b15 b937 )
    ( on b80 b15 )
    ( on b754 b80 )
    ( on b940 b754 )
    ( on b186 b940 )
    ( on b225 b186 )
    ( on b402 b225 )
    ( on b386 b402 )
    ( on b300 b386 )
    ( on b952 b300 )
    ( on b332 b952 )
    ( on b388 b332 )
    ( on b88 b388 )
    ( on b262 b88 )
    ( on b59 b262 )
    ( on b801 b59 )
    ( on b295 b801 )
    ( on b504 b295 )
    ( clear b504 )
  )
  ( :tasks
    ( Make-26Pile b729 b806 b171 b413 b369 b57 b774 b937 b15 b80 b754 b940 b186 b225 b402 b386 b300 b952 b332 b388 b88 b262 b59 b801 b295 b504 )
  )
)
