<?php

namespace App\Http\Controllers;

use DB;
use App\Post;
use App\User;
use Illuminate\Http\Request;

class FollowsController extends Controller
{
    //kalau error coba ini di jadikan comment
//    public function __construct()
//    {
//        $this->middleware('auth');
//    }
    public function store($id)
    {
        //mentoggle untuk user yang sedang login mengikuti/tidak megikuti suatu kelompok
        $post = Post::find($id);
        return auth()->user()->following()->toggle($post);
    }

    public function notify($post_id)
    {
        $users = DB::table('post_user')
            ->join('profiles', function ($join) {
                $join->on('post_user.user_id', '=', 'profiles.id');
            })
            ->where('post_id' , $post_id)
            ->get();
        $exists = DB::table('post_user')
            ->join('profiles', function ($join) {
                $join->on('post_user.user_id', '=', 'profiles.id');
            })
            ->where('post_id' , $post_id)
            ->first();
        if(!$exists) {
            $users = "null";
        }
        return response()->json($users);
    }

    public function update(Request $request)
    {
        //masukan berupa id post yang  yang akan di acc
        $status = DB::table('post_user')
            ->where([
                ['post_id', $request->input('post_id')],
                ['user_id', $request->input('user_id')]
            ])
            ->value('join_status');
        if($status == 0) {
            DB::table('post_user')
                ->where([
                    ['post_id', $request->input('post_id')],
                    ['user_id', $request->input('user_id')]
                ])
                ->update(['join_status' => 1]);
        } else {
            DB::table('post_user')
                ->where([
                    ['post_id', $request->input('post_id')],
                    ['user_id', $request->input('user_id')]
                ])
                ->update(['join_status' => 0]);
        }
        return response()->json("Confirm successfully");
    }

    public function getJoinStatus(Request $request) {
       
        $joinStatus = DB::table('post_user')
            ->where([
                ['user_id' , $request->input('user_id')],
                ['post_id', $request->input('post_id')]
            ])
            ->first();
        if(!$joinStatus) {
            $joinStatus = "null";
        }
        return response()->json($joinStatus);
    }

    public function destroy(Request $request, $user_id, $post_id) {
       
        $status = DB::table('post_user')
            ->where([
                ['user_id' , $user_id],
                ['post_id', $post_id]
            ])
            ->delete();
        if ($status) {
            return response()->json("You successfully unjoin");
        } else {
            return response()->json("You failed unjoin");
        }
    }
//    public function decline($post_id , $user_id)
//    {
//        //digunakan untuk menolak orang yang ingin join
//        $deniedUser = User::find($user_id);
//        return Post::find($post_id)->followers()->toogle($deniedUser);
//    }

}
